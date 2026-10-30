<div align="center">

![KDP Book](src/splash/kdp-book.jpg)

**kdp-book: A set of notes on the topic of concurrency, multithreading and distributed programming!**

[![Read the PDF](https://img.shields.io/badge/Download-PDF-red)](pdf/kdp-book.pdf)

</div>

---

**kdp-book** is an illustrative booklet on the topic of concurrent programming.  The goal I had with this booklet is to illustrate many of the classic problems in concurrent programming using different synchronization primitives and techniques. The examples largely come from my university notes on the relevant [subject on concurrent programming](https://rti.etf.bg.ac.rs/rti/ir3kdp/index.html).

It's written in Markdown and built with pandoc (LuaLaTeX). It's only available in the Serbian language though a translation into other languages is in progress.

## Building the PDF

Install Pandoc, LuaLaTeX (TeX Live), and the Ubuntu and Ubuntu Mono fonts, then run:

```sh
make book
```

The result is `build/kdp-book.pdf`. Markdown remains the source: Pandoc uses
its default LaTeX template, `metadata.yaml` sets the fonts and A4 page layout,
and `src/preamble.tex` styles the title page, headings, running headers,
captions, and code listings. `tools/listings.lua` preserves the C++/Java
listings and EasyMT keyword highlighting.

The warm palette and chapter design are inspired by Eden Gilbert Kiseka's
[The No-Nonsense Guide to Assembly](https://github.com/edengilbertus/the-no-nonsense-guide-to-assembly).


## Format
The first chapter explores various spinlock algorithms 

 1. Test-and-set algorithm
 2. Test-and-test-and-set algorithm
 3. Peterson (Tie-breaker) 
 4. Ticket algorithm
 5. Anderson's algorithm
 6. Bakery algorithm
 7. CLH algorithm

The rest of the chapters of the book explore the same pr using different synchronization primitives: semaphores, regions, monitors. The following is the structure of each chapter.

 1. Introduction
 2. Simple synchronization
 3. Mutual exclusion
 4. Producers and consumers
 5. Synchronization barrier
 6. Shortest job next
 7. Sleeping barber
 8. Readers and writers
 9. Cigarette smokers
 10. Dining philosophers


## Syntax
The examples in the book are borrowed from [EasyMT](https://github.com/yanevskiv/easymt) which is a C++ library I wrote that drastically simplifies the syntax that would otherwise be necessary to illustrate these concepts.


```cpp
#include <sem.h>
#define N 5

Sem mutex = 1;

void thread(int id) {
    while (true) {
        wait(mutex);
        
        // ... critical section ...

        signal(mutex);
    }
}

int main() {
    Thread ta[N];
    for (int i = 0; i < N; i++)
        ta[i] = createThread(thread, i);
    for (int i = 0; i < N; i++)
        joinThread(threads[i]);
    return 0;
}
```

## Author
Copyright (C) 2026 Ivan Janevski