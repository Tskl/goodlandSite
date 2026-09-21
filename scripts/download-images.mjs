// Κατεβάζει όλες τις εικόνες του goodland.gr από το content/images-manifest.json
//
//   node scripts/download-images.mjs
//
// Χωρίς εξαρτήσεις, χωρίς npm install. Ξαναπατιέται ελεύθερα:
// ό,τι υπάρχει ήδη στο δίσκο παραλείπεται.

import { mkdir, writeFile, stat, readFile } from 'node:fs/promises';
import { dirname, join } from 'node:path';

const MANIFEST = 'content/images-manifest.json';
const OUT_ROOT = 'public/images';
const CONCURRENCY = 6;

const exists = async (p) => { try { await stat(p); return true; } catch { return false; } };

const manifest = JSON.parse(await readFile(MANIFEST, 'utf8'));

const jobs = [];
for (const [slug, images] of Object.entries(manifest)) {
  images.forEach((img, i) => {
    const ext = (img.full.match(/\.(jpe?g|png|webp|gif)$/i)?.[1] ?? 'jpg').toLowerCase();
    jobs.push({
      url: img.full,
      dest: join(OUT_ROOT, slug, `${String(i + 1).padStart(2, '0')}.${ext}`),
    });
  });
}

console.log(`${jobs.length} εικόνες σε ${Object.keys(manifest).length} φακέλους\n`);

let done = 0, skipped = 0;
const failed = [];

async function run(job) {
  if (await exists(job.dest)) { skipped++; return; }
  await mkdir(dirname(job.dest), { recursive: true });
  for (let attempt = 1; attempt <= 3; attempt++) {
    try {
      const res = await fetch(job.url);
      if (!res.ok) throw new Error(`HTTP ${res.status}`);
      const buf = Buffer.from(await res.arrayBuffer());
      if (buf.length < 1024) throw new Error(`πολύ μικρό αρχείο (${buf.length} bytes)`);
      await writeFile(job.dest, buf);
      done++;
      process.stdout.write(`\r${done + skipped}/${jobs.length}  ${job.dest}`.padEnd(90));
      return;
    } catch (err) {
      if (attempt === 3) failed.push({ ...job, error: String(err.message ?? err) });
      else await new Promise((r) => setTimeout(r, attempt * 1000));
    }
  }
}

const queue = [...jobs];
await Promise.all(
  Array.from({ length: CONCURRENCY }, async () => {
    while (queue.length) await run(queue.shift());
  })
);

console.log(`\n\nΚατέβηκαν: ${done}   Υπήρχαν ήδη: ${skipped}   Απέτυχαν: ${failed.length}`);
if (failed.length) {
  console.log('\nΑΠΟΤΥΧΙΕΣ — ξανατρέξε το script:');
  for (const f of failed) console.log(`  ${f.dest}\n    ${f.url}\n    ${f.error}`);
  process.exitCode = 1;
}
