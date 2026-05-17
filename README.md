# KDP Book
This is a small illustrative booklet on the topic of concurrent programming.  It's written in LuaLaTeX.

The goal I had with this booklet is to illustrate many of the classic problems in concurrent programming using different synchronization primitives and techniques.


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


## Source Material
The booklet is based on a class I've taken in my university called [KDP - Konkurentno i Distribuirano programiranje](https://rti.etf.bg.ac.rs/rti/ir3kdp/index.html). It directly translates to "Concurrent and Distributed programming" in English.

The class itself is based on the following book.
```
Foundations of Multithreaded, Parallel and Distributed Programming
Gregory Andrews,
Addison Wesley, 2000 
```

The syntax used on the slides are rather arcane though.

## Author
Ivan Janevski (C) 2026