% ソフトウェアの世界を切り拓く / Breaking Ground in the World of Software

## 松下 祐介 / Yusuke Matsushita

_Published in 理学のススメ (An Encouragement of Science) No. 7 ([PDF](https://dl5s7ayfvssw3.cloudfront.net/WEB_info2/p/pub/8311/54-1.pdf#page=7), [HTML](https://www.s.u-tokyo.ac.jp/ja/story/newsletter/page/7899/)) in the University of Tokyo 理学部ニュース (News from Faculty of Science) Vol. 54, No. 1, May 2022. Originally in Japanese, Translated into English by the Author._

私たちの暮らしは、たくさんの「ソフトウェア」によって支えられている。まずパソコンやスマホの色々なアプリケーションが思い浮かぶだろうか。その裏側でマウスやタッチパネル、グラフィクス、ネットワークを動かすのもソフトウェアだ。さらには、身の回りの家電、銀行のATM、街を走る自動車、交通を守る信号機、病院のMRI、航空機や人工衛星、それらを制御しているのもソフトウェアだ。
Our life is founded on various kinds of _software_. Apps of laptops and smart phones may come across your mind as software. Also, behind that, mouses, touch panels, graphics and networks are driven by another kind of software, too. Furthermore, home appliances around you, bank ATMs, cars and traffic lights in your city, MRIs in the hospital, airplanes and artificial satellites in the sky, they are all managed by some software.

ソフトウェアの開発は人間と機械の共同作業だ。プログラマ達は、欲しいソフトウェアを実現するための具体的な計算方法を、プログラミング言語、すなわち人間と機械の共通語で、プログラムとして表現する。もちろん、意図せぬ挙動、いわゆる「バグ」がないように、注意して工夫して開発する。それでも人間の仕事であるから、しばしばバグが生まれ見逃されてしまう。これを防ぐ手法の一つが、プログラムが意図した仕様を満たすことを論理的に証明する、「検証」だ。
Developing software is collaboration of humans and machines. Programmers design the computation for implementing the software they want and express that as a program in a _programming language_---the lingua franca between humans and machines. Of course, they try to avoid _bugs_---unintentional behaviors---by being careful and clever. But humans are not perfect. Too often, bugs slip in and get overlooked. One way to prevent that is to prove that the program satisfies the intended specification---_verification_.

一般にアプリケーションはいくつかの抽象化の階層を重ねて得られるが、そのなかでもハードウェアに近い低層のソフトウェアを、「システムソフトウェア」という。特に、メモリを直接操作することで、高性能の計算を実現できる。一方でこうしたソフトウェアは、エラー検出などによる保護が薄いため、深刻なバグが埋め込まれる危険性が高い。
In general, applications are built on top of many layers of abstractions. Among that, software of a low layer, near hardware, is called _system software_. It can achieve high-performance computation by operating directly on the memory. On the other hand, put under weaker protection, such software is more likely to have serious bugs.

私は、ソフトウェア科学、特にシステムソフトウェアの検証を研究している。
I study software science, specifically how to verify system software.

2015年、「Rust」という言語が誕生し、システムソフトウェアを堅牢に開発できる言語として、急速に産業で使われ出している。Rustは強い静的な「型システム」により、プログラムのメモリ安全性を自動で検査してくれる。その鍵となるのが、メモリの特定領域へのアクセス権限、「所有権」。所有権にもとづく型は長らく研究されてきたが、Rustは所有権を一時的に渡す「借用」という仕組みを導入し、実用的なレベルへと高めた。
In 2015, _Rust_ was born as a programming language for developing robust system software. Now it has been rapidly and widely adopted in the industry. Rust has a strong static _type system_ that automatically checks the memory safety of programs. Its key is _ownership_---access permission to a specific region of the memory. Types with ownership had long been academically studied, but Rust was the first to bring them into the mainstream, especially by introducing _borrows_, or temporary transfers of ownership.

型の保証を上手く使って、Rustプログラムを効率よく検証できないだろうか？ Rustでは事前に期限を決めて所有権を借用できる。所有権があれば自由にメモリ上の値を更新できる。また、借用した所有権は分割でき、自由に捨てられる。そのあと、貸し手が所有権を回復したとき、更新後のメモリ上の値がわかるように、計算をモデル化すること。これが問題だった。
Can't we verify Rust programs efficiently by using the guarantees of the types? In Rust, an object can borrow ownership by deciding the deadline beforehand. While having ownership, the borrower can freely update the values of the memory region. Also, borrowed ownership can be split and disposed of very freely. When the lender finally retrieves the ownership, we should be able to know the updated values of the memory region---the problem was how to build the model for that.

私の主著論文「RustHorn」は、未来のメモリ上の値を先取りする「預言」というアイデアでこれを解決した。概略を図にまとめた。
My lead-authored work _RustHorn_ solved this by _prophecy_---peeking at values of the memory in the future ahead of time. The figure outlines the idea.

<img src="./2022-break-ground-software-figure.png" height="300" alt="Overview of RustHorn" />

RustHornでは、この手法が様々なRustプログラムを厳密にモデル化できることを証明し、自動検証への有用性も実験的に示した。この研究の影響として、これにもとづく本格的なRustの半自動検証器をフランスの学生が作っている。私の別の主著論文「RustHornBelt」では、広いクラスのRustプログラムに対するRustHornの手法の正当性を、Coqという証明支援システムで証明した。私は今、借用と預言をもちいた、新しいシステムソフトウェア開発の形を探っている。
In our work RustHorn, we proved that this method provides an exact model to a wide class of Rust programs and also empirically demonstrated that it is useful for fully automated verification. Based on this work, a French student has been making a semi-automated verifier for Rust. My other lead-authored work RustHornBelt proved in the Coq proof assistant the correctness of RustHorn's method for an even wider class of Rust programs. I am currently exploring a new approach to systems software development leveraging borrowing and prophecy.

実際のソフトウェア開発は、とても人間的な営みで、時に泥臭い。だからこそ、理学の尖ったアイデアが現場を切り拓く光となる。そう信じて、私は今日も研究する。
Software development in the real world is very human, often requiring rough efforts. But for that reason, sharp ideas from science can be a spark to break new ground in the real world. Believing so, I do research again today.

[_Back to Home_](../)
