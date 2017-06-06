module List0



(* The type of list is defined just as a datatype as in most functional language *)
type list (a:Type) =
  | Nil  : list a
  | Cons : hd:a -> tl:list a -> list a

(* For instance *)
let l0 = Cons 1 (Cons 2 (Cons 3 Nil))

(* We can define some functions by pattern matching *)

let is_Nil (#a:Type) (l:list a) : bool =
  match l with
  | Nil -> true
  | _ -> false

let is_Cons _ = admit ()

(* These are in fact automatically generated for us as Nil? and Cons? *)


(* We can define more interesting functions by recursion on the type of lists *)

let rec length (#a:Type) (l:list a) : nat =
  match l with
  | Nil -> 0
  | Cons _ xs -> 1 + length xs

(* The emacs fstar-mode also supports evaluating functions *)
(* so we can test our function by applying it : length l0 *)


(* The type of lists is in fact defined in the standard library *)

