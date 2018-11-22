{*******************************************************}
{                                                       }
{       ChengTX                                         }
{                                                       }
{       ∞Ê»®À˘”– (C) 2016 ChengTX                       }
{                                                       }
{*******************************************************}

unit uDllExport;

interface
uses
  uEngIntf, uBaseEngImpl, System.Win.ComObj,Winapi.ActiveX;

function IntfGetDataBySql(ASql: string; out AData: OleVariant; out ErrMsg: string;AConStr: string = '';ACompress: Boolean = False): Boolean;stdcall;
function IntfPostDataByTable(ATable: string;AData: OleVariant; out ErrMsg: string;AConStr: string = ''): Boolean;stdcall;
function IntfGetDataBySqlArr(ASqlArr: OleVariant; out ADataArr: OleVariant; out ErrMsg: string;AConStr: string = '';ACompress: Boolean = False): Boolean;stdcall;
function IntfPostDataBySqlArr(ATableArr: OleVariant; ADataArr: OleVariant; out ErrMsg: string;AConStr: string = ''): Boolean;stdcall;
function IntfPostModData(AModID: Integer; ADataArr: OleVariant; out ErrMsg: string;AConStr: string = '';AChildID: Integer=0): Boolean;stdcall;
function IntfspGetData(AspName: string;AParamArr: OleVariant; out AData: Olevariant;Out ErrMsg:string;AConStr: string = '';ACompress: Boolean = False): Boolean;stdcall;
function IntfspExec(AspName: string;var AParamArr: OleVariant; out ErrMsg:string;AConStr: string = ''):boolean;stdcall;

implementation

type
  TEngImplClass = class of TBaseEngImpl;


function IntfGetDataBySql(ASql: string; out AData: OleVariant; out ErrMsg: string;AConStr: string = '';ACompress: Boolean = False): Boolean;
var
  LIntf: IEngIntf;
begin
  try
    CoInitialize(nil);
    LIntf := TEngImplClass.Create(AConStr);
    Result := LIntf.GetDataBySql(ASql,AData,ErrMsg,ACompress);
  finally
    CoUnInitialize;
  end;
end;

function IntfPostDataByTable(ATable: string;AData: OleVariant; out ErrMsg: string;AConStr: string = ''): Boolean;
var
  LIntf: IEngIntf;
begin
  try
    CoInitialize(nil);
    LIntf := TEngImplClass.Create(AConStr);
    Result := LIntf.PostDataByTable(ATable,AData,ErrMsg);
  finally
    CoUnInitialize;
  end;
end;

function IntfGetDataBySqlArr(ASqlArr: OleVariant; out ADataArr: OleVariant; out ErrMsg: string;AConStr: string = '';ACompress: Boolean = False): Boolean;
var
  LIntf: IEngIntf;
begin
  try
    CoInitialize(nil);
    LIntf := TEngImplClass.Create(AConStr);
    Result := LIntf.GetDataBySqlArr(ASqlArr,ADataArr,ErrMsg,ACompress);
  finally
    CoUnInitialize;
  end;
end;

function IntfPostDataBySqlArr(ATableArr: OleVariant; ADataArr: OleVariant; out ErrMsg: string;AConStr: string = ''): Boolean;
var
  LIntf: IEngIntf;
begin
  try
    CoInitialize(nil);
    LIntf := TEngImplClass.Create(AConStr);
    Result := LIntf.PostDataBySqlArr(ATableArr,ADataArr,ErrMsg);
  finally
    CoUnInitialize;
  end;
end;

function IntfPostModData(AModID: Integer; ADataArr: OleVariant; out ErrMsg: string;AConStr: string = '';AChildID: Integer = 0): Boolean;
var
  LIntf: IEngIntf;
begin
  try
    CoInitialize(nil);
    LIntf := TBaseModPostEngImpl.Create(AConStr,AModID,AChildID);
    Result := LIntf.PostDataBySqlArr(varNull,ADataArr,ErrMsg);
  finally
    CoUnInitialize;
  end;
end;

function IntfspGetData(AspName: string;AParamArr: OleVariant; out AData: Olevariant;Out ErrMsg:string;AConStr: string = '';ACompress: Boolean = False): Boolean;
var
  LIntf: IEngIntf;
begin
  try
    CoInitialize(nil);
    LIntf := TEngImplClass.Create(AConStr);
    Result := LIntf.spGetData(AspName,AParamArr,AData,ErrMsg,ACompress);
  finally
    CoUnInitialize;
  end;
end;

function IntfspExec(AspName: string;var AParamArr: OleVariant; out ErrMsg:string;AConStr: string = ''):boolean;
var
  LIntf: IEngIntf;
begin
  try
    CoInitialize(nil);
    LIntf := TEngImplClass.Create(AConStr);
    Result := LIntf.spExec(AspName,AParamArr,ErrMsg);
  finally
    CoUnInitialize;
  end;
end;

end.
