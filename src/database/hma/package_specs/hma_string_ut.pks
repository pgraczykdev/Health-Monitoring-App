create or replace package hma.hma_string_ut is
    --%suite()

    --%test(Test for the split function: simple case with commas)
    procedure test_split_simple;

    --%test(Test for the split function: empty string)
    procedure test_split_empty_string;

    --%test(Test for the split function: no delimiter found)
    procedure test_split_no_delimiter;

    --%test(Test for the split function: consecutive delimiters)
    procedure test_split_consecutive_delimiters;

    --%test(Test for the join function: simple case with comma separator)
    procedure test_join_simple;

    --%test(Test for the join function: empty list)
    procedure test_join_empty_list;

    --%test(Test for the join function: single element)
    procedure test_join_single_element;

    --%test(Test for the join function: different delimiter)
    procedure test_join_different_delimiter;

end hma_string_ut;
/


-- sqlcl_snapshot {"hash":"990bc74242ab3354fcac752d69ecc5787077ab41","type":"PACKAGE_SPEC","name":"HMA_STRING_UT","schemaName":"HMA"}