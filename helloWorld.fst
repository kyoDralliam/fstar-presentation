(* This resides in a file called helloWorld.fst *)
module HelloWorld

open FStar.All

(* Here is our first program : a simple hello world *)
let main () : ML unit =
  FStar.IO.print_string "Hello World !"


(* And we can call it. *)
let () = main ()

(* To see it in action we need to extract it to some other language for example OCaml : *)

(*! fstar.exe --codegen OCaml helloWorld.fst *)

(* and then compile the extracted file with the targeted compiler. *)
