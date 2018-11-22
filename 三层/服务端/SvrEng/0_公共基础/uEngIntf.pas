{*******************************************************}
{                                                       }
{       ChengTX                                         }
{                                                       }
{       ∞Ê»®À˘”– (C) 2016 ChengTX                       }
{                                                       }
{*******************************************************}

unit uEngIntf;

interface

type
  IEngIntf = interface
  ['{6225325F-4823-4DA0-8420-560CE788E708}']
    function GetDataBySql(ASql: string; out AData: OleVariant; out ErrMsg: string;ACompress: Boolean): Boolean;
    function PostDataByTable(ATable: string;AData: OleVariant; out ErrMsg: string): Boolean;
    function GetDataBySqlArr(ASqlArr: OleVariant; out ADataArr: OleVariant; out ErrMsg: string;ACompress: Boolean): Boolean;
    function PostDataBySqlArr(ATableArr: OleVariant; ADataArr: OleVariant; out ErrMsg: string): Boolean;
    function spGetData(AspName: string;AParamArr: OleVariant; out AData: Olevariant;Out ErrMsg:string;ACompress: Boolean): Boolean;
    function spExec(AspName: string;var AParamArr: OleVariant; out ErrMsg:string):boolean;
  end;

implementation

end.
