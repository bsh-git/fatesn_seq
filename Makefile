all: fatesnseq1.dot fatesnseq2.dot fatesnseq3.dot

.SUFFIXES: .rb .dot
.rb.dot:
	ruby -I. $<


fatesnseq1.dot fatesnseq2.dot fatesnseq3.dot: ScenarioGraph.rb

