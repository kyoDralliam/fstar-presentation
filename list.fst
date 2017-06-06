module List

open FStar.List.Tot

(* Some syntactic sugar *)
let nil = []
let cons x xs = x :: xs

let l0 = 1 :: 2 :: 3 :: []

(* Nil? l0 ~> false *)
(* Cons? l0 ~> true *)

(* What about getting the tail of a list ? *)
let tail0 (#a:Type) (l:list a) : list a =
  match l with
  | _ :: xs -> xs
  | [] -> admit ()

(* There is nothing good to put in the Nil branch : *)
(* we should not apply tail to empty lists ! *)
(* That's where refinement types enter into play ! *)

let tail1 (#a:Type) (l:list a{Cons? l}) : list a =
  match l with
  | _ :: xs -> xs

(* This is also generated by F* as Cons?.hd and Cons?.tl *)
(* Cons?.tl l0 ~> 2 :: 3 :: [] *)