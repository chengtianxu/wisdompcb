unit CalcIntf;

interface
uses
  System.Classes, DB;

type
  TCalcParamTpye = (ptQuanJu,PtDept,PtBom);
  ICalc = interface
    function GetTableValue(ATableStr: string; var ret: Boolean): string;
    function ReplaceParamStr(AOldStr: string;ADataSet: TDataSet;AParamType: TCalcParamTpye;var Ret: Boolean): string;
    function ReplaceTableToValue(AOldStr: string;var Ret: Boolean): string;
    function ReplaceIFStr(AOldStr: string;var ANewStr: string): Boolean;
    function CalcStr(AOldStr: string; var ANewStr: string; AgParamDs: TDataSet; ADeptParamDs: TDataSet;ABomParamDs: TDataSet;out ErrMsg: string):Boolean;
  end;

implementation

end.
