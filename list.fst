(*** Inductive types ***)
module List

(*! The type of list is defined just as a datatype !*)
(*! as in most functional language !*)
type list (a:Type) =
  | Nil  : list a
  | Cons : hd:a -> tl:list a -> list a

(*! For instance !*)
let l0 = Cons 1 (Cons 2 (Cons 3 Nil))

(******************************************************************************)
(*** Pattern-matching ***)

(*! We can define some functions by pattern matching !*)

let is_Nil (#a:Type) (l:list a) : bool =
  match l with
  | Nil -> true
  | _ -> false

let is_Cons _ = admit ()








(*! These are in fact automatically generated for us as Nil? and Cons? !*)

(******************************************************************************)
(*** Recursion (take 1) ***)
(*! We can define more interesting functions by recursion on the type of lists !*)

let rec length (#a:Type) (l:list a) : nat =
  match l with
  | Nil -> 0
  | Cons _ xs -> 1 + length xs

(*! The emacs fstar-mode also supports evaluation !*)
(*! so we can test our function by applying it : length l0 !*)

let rec append (#a:Type) (l1 l2:list a) : list a =
  admit ()
(******************************************************************************)
(*** Higher-order ***)

let rec map (#a #b:Type) (f:a -> b) (l:list a) : list b =
  match l with
  | Nil -> Nil
  | Cons x xs -> Cons (f x) (map f xs)

let rec mem (#a:Type) (p:a -> bool) (l:list a) : bool =
  admit ()

let rec foldl (#a #b:Type) (f : a -> b -> a) (acc:a) (l:list b) : a
= admit ()

(******************************************************************************)
(*** Non-termination ***)

(*+ The following function is ill-formed : +*)
(*+ it is correctly rejected by F* by default +*)

let rec not_well_founded (#a:Type) (l:list a) : Dv nat =
  match l with
  | Nil -> 0
  | Cons x xs -> not_well_founded (Cons x xs)


(*+ Dv Nat is a computation type +*)
(*! Values of this type do not need to terminate !*)

(*! The default effect is Tot !*)
