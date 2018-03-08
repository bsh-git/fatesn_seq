all: fatesnseq1.dot fatesnseq2.dot

.SUFFIXES: .rb .dot
.rb.dot:
	ruby -I. $<


fatesnseq1.dot fatesnseq2.dot: ScenarioGraph.rb

