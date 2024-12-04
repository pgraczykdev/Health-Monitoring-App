-- liquibase formatted sql
-- changeset HMA:fe0f05bf8bc12bbf64f2b74116e0ca4bec96b5ea stripComments:false logicalFilePath:package_bodies\hma_string_ut.sql
-- sqlcl_snapshot src/database/hma/package_bodies/hma_string_ut.pkb:null:fe0f05bf8bc12bbf64f2b74116e0ca4bec96b5ea:create

create or replace package body hma.hma_string_ut is

    procedure test_split_simple is
        l_results hma_varchar2.hma_t_varchar2;
    begin
      -- Given && When
        l_results := hma_string.split('apple,banana,cherry', ',');

      -- Then
        ut.expect(l_results(1)).to_equal('apple');
        ut.expect(l_results(2)).to_equal('banana');
        ut.expect(l_results(3)).to_equal('cherry');
    end test_split_simple;

    procedure test_split_empty_string is
        l_results hma_varchar2.hma_t_varchar2;
    begin
      -- Given && When
        l_results := hma_string.split('', ',');

      -- Then
        ut.expect(l_results.count).to_equal(0);
    end test_split_empty_string;

    procedure test_split_no_delimiter is
        l_results hma_varchar2.hma_t_varchar2;
    begin
      -- given && when
        l_results := hma_string.split('applebanana', ',');

      -- Then
        ut.expect(l_results.count).to_equal(1);
        ut.expect(l_results(1)).to_equal('applebanana');
    end test_split_no_delimiter;

    procedure test_split_consecutive_delimiters is
        l_results hma_varchar2.hma_t_varchar2;
    begin
      -- Given && When
        l_results := hma_string.split('apple,,banana', ',');

      -- Then
        ut.expect(l_results.count).to_equal(3);
        ut.expect(l_results(1)).to_equal('apple');
        ut.expect(l_results(2)).to_equal('');  -- Empty part between consecutive delimiters
        ut.expect(l_results(3)).to_equal('banana');
    end test_split_consecutive_delimiters;

    procedure test_join_simple is

        l_list   hma_varchar2.hma_t_varchar2 := hma_varchar2.hma_t_varchar2('apple', 'banana', 'cherry');
        l_result hma_varchar2.vc32767;
    begin
      -- Given && When
        l_result := hma_string.join(l_list, ', ');

      -- Then
        ut.expect(l_result).to_equal('apple, banana, cherry');
    end test_join_simple;

    procedure test_join_empty_list is
        l_list   hma_varchar2.hma_t_varchar2;
        l_result hma_varchar2.vc32767;
    begin
      -- Given && When
        l_result := hma_string.join(l_list, ', ');

      -- Then
        ut.expect(l_result).to_equal('');
    end test_join_empty_list;

   -- Test for the join function: single element
    procedure test_join_single_element is
        l_list   hma_varchar2.hma_t_varchar2 := hma_varchar2.hma_t_varchar2('apple');
        l_result hma_varchar2.vc32767;
    begin
      -- Given && When
        l_result := hma_string.join(l_list, ', ');

      -- Then
        ut.expect(l_result).to_equal('apple');
    end test_join_single_element;

   -- Test for the join function: different delimiter
    procedure test_join_different_delimiter is

        l_list   hma_varchar2.hma_t_varchar2 := hma_varchar2.hma_t_varchar2('apple', 'banana', 'cherry');
        l_result hma_varchar2.vc32767;
    begin
      --Given && When
        l_result := hma_string.join(l_list, ' | ');

      -- Then
        ut.expect(l_result).to_equal('apple | banana | cherry');
    end test_join_different_delimiter;

end hma_string_ut;
/