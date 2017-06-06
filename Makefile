FSTAR_HOME=../everest/FStar
FSTAR=$(FSTAR_HOME)/bin/fstar.exe
include $(FSTAR_HOME)/ulib/ml/Makefile.include

all:

HelloWorld.ml: helloWorld.fst
	$(FSTAR) --codegen OCaml helloWorld.fst

HelloWorld: HelloWorld.ml
	$(OCAMLOPT) -o $@ $<


clean:
	rm -f *.{ml,cmi,cmo,cmx,o}
	rm -f HelloWorld || :
