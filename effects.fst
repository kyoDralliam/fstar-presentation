(*** A world of effects ***)
module Effects

(* begin hide *)
open FStar.Heap
open FStar.ST
module FStarAll = FStar.All
(* end hide *)

effect Totality (a:Type) = Tot a

effect NonTermination (a:Type) = Dv a

effect Exception (a:Type) = Ex a

effect State (a:Type) = St a

(******************************************************************************)
(*** And wp calculus ***)

(*! wp : weakest precondition !*)

let state_pre = heap -> Type0
let state_post (a:Type) = a -> heap -> Type0

let state_wp (a:Type) = state_post a -> state_pre

effect StateWP (a:Type) (wp:st_wp a) = STATE a wp

effect StatePrePost (a:Type) (pre:st_pre) (post:heap -> st_post a) = ST a pre post

(******************************************************************************)
(*** Effects at works ***)

let incr (r:ref int) : St unit =
  r := !r + 1

let incr_mod (n:nat) (r:ref int)
  : ST unit
    (requires (fun h0 -> let x = sel h0 r in 0 <= x /\ x < n))
    (ensures (fun h0 () h1 -> let x = sel h1 r in 0 <= x /\ x < n))
= let x = !r in
  if x >= n - 1 then r := 0 else r := x + 1


(******************************************************************************)
(*** Higher-Order example ***)

let rec iter (#a:Type) (f: a -> St unit) (l:list a) : St unit =
  match l with
  | [] -> ()
  | x :: xs -> f x ; iter f xs

let imperative_factorial (l:list int) : St int =
  let c = alloc 1 in
  iter (fun x -> c := !c `op_Multiply` x) l ;
  !c

(******************************************************************************)
(*** Sub-effecting ***)

let useless_example (l:list int) : FStar.All.ML int =
  let f : int -> Tot unit = fun x -> () in
  iter f l ;
  42

(*+ A lattice of effects : Tot <: St <: ML  +*)

(*! But there is no effect polymorphism !*)
