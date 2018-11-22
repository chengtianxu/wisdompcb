{*******************************************************}
{                                                       }
{       ChengTX                                         }
{                                                       }
{       版权所有 (C) 2016 ChengTX                       }
{                                                       }
{*******************************************************}

unit uDllExport;

interface
uses
  uEngIntf, ukucunguanli, uBaseEngImpl;

function IntfGetDataBySql(ASql: string; out AData: OleVariant; out ErrMsg: string;AConStr: string = '';ACompress: Boolean = False): Boolean;stdcall;
function IntfPostDataByTable(ATable: string;AData: OleVariant; out ErrMsg: string;AConStr: string = ''): Boolean;stdcall;
function IntfGetDataBySqlArr(ASqlArr: OleVariant; out ADataArr: OleVariant; out ErrMsg: string;AConStr: string = '';ACompress: Boolean = False): Boolean;stdcall;
function IntfPostDataBySqlArr(ATableArr: OleVariant; ADataArr: OleVariant; out ErrMsg: string;AConStr: string = ''): Boolean;stdcall;
function IntfPostModData(AModID: Integer; ADataArr: OleVariant; out ErrMsg: string;AConStr: string = '';AChildID: Integer=0): Boolean;stdcall;
function IntfspGetData(AspName: string;AParamArr: OleVariant; out AData: Olevariant;Out ErrMsg:string;AConStr: string = '';ACompress: Boolean = False): Boolean;stdcall;
function IntfspExec(AspName: string;AParamArr: OleVariant; out ErrMsg:string;AConStr: string = ''):boolean;stdcall;

implementation

type
  TEngImplClass = class of TBaseEngImpl;


function IntfGetDataBySql(ASql: string; out AData: OleVariant; out ErrMsg: string;AConStr: string = '';ACompress: Boolean = False): Boolean;
var
  LIntf: IEngIntf;
begin
  LIntf := TEngImplClass.Create(AConStr);
  Result := LIntf.GetDataBySql(ASql,AData,ErrMsg,ACompress);
end;

function IntfPostDataByTable(ATable: string;AData: OleVariant; out ErrMsg: string;AConStr: string = ''): Boolean;
var
  LIntf: IEngIntf;
begin
  LIntf := TEngImplClass.Create(AConStr);
  Result := LIntf.PostDataByTable(ATable,AData,ErrMsg);
end;

function IntfGetDataBySqlArr(ASqlArr: OleVariant; out ADataArr: OleVariant; out ErrMsg: string;AConStr: string = '';ACompress: Boolean = False): Boolean;
var
  LIntf: IEngIntf;
begin
  LIntf := TEngImplClass.Create(AConStr);
  Result := LIntf.GetDataBySqlArr(ASqlArr,ADataArr,ErrMsg,ACompress);
end;

function IntfPostDataBySqlArr(ATableArr: OleVariant; ADataArr: OleVariant; out ErrMsg: string;AConStr: string = ''): Boolean;
var
  LIntf: IEngIntf;
begin
  LIntf := TEngImplClass.Create(AConStr);
  Result := LIntf.PostDataBySqlArr(ATableArr,ADataArr,ErrMsg);
end;

function IntfPostModData(AModID: Integer; ADataArr: OleVariant; out ErrMsg: string;AConStr: string = '';AChildID: Integer = 0): Boolean;
var
  LIntf: IEngIntf;
begin
  case AModID of
    38: LIntf := TMod38PostEngImpl.Create(AConStr,AModID,AChildID);
  else
    ErrMsg := '引擎中没有该模块的处理';
    Result := False;
    Exit;
  end;
  Result := LIntf.PostDataBySqlArr(varNull,ADataArr,ErrMsg);
end;

function IntfspGetData(AspName: string;AParamArr: OleVariant; out AData: Olevariant;Out ErrMsg:string;AConStr: string = '';ACompress: Boolean = False): Boolean;
var
  LIntf: IEngIntf;
begin
  LIntf := TEngImplClass.Create(AConStr);
  Result := LIntf.spGetData(AspName,AParamArr,AData,ErrMsg,ACompress);
end;

function IntfspExec(AspName: string;AParamArr: OleVariant; out ErrMsg:string;AConStr: string = ''):boolean;
var
  LIntf: IEngIntf;
begin
  LIntf := TEngImplClass.Create(AConStr);
  Result := LIntf.spExec(AspName,AParamArr,ErrMsg);
end;

end.
