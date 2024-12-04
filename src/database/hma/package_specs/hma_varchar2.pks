create or replace package hma.hma_varchar2 is
    subtype vc10 is varchar2(10);
    subtype vc20 is varchar2(20);
    subtype vc50 is varchar2(50);
    subtype vc100 is varchar2(100);
    subtype vc200 is varchar2(200);
    subtype vc255 is varchar2(255);
    subtype vc500 is varchar2(500);
    subtype vc1000 is varchar2(1000);
    subtype vc2000 is varchar2(2000);
    subtype vc4000 is varchar2(4000);
    subtype vc32767 is varchar2(32767);
    type hma_t_varchar2 is
        table of vc4000;
end hma_varchar2;
/


-- sqlcl_snapshot {"hash":"97847de41a8ea95fba89d198bc6c0e08e9989a3e","type":"PACKAGE_SPEC","name":"HMA_VARCHAR2","schemaName":"HMA"}