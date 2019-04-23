# keep_if delete_if destructive selection and deletion
hackerrank.keep_if {|k,v| k.is_a? Integer }
hackerrank.delete_if { |k, v| (v % 2) == 0  }
hackerrank.store 543121, 100

#For non-destructive selection or rejection, we can use select, reject, and drop_while similar to Array-Selection
