unit TestQkScript;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, qkScript;

type
  TfrmqkScriptTest = class(TForm)
    pgc1: TPageControl;
    ts1: TTabSheet;
    mmo1: TMemo;
    mt1: TFDMemTable;
    btn1: TButton;
    mt2: TFDMemTable;
    ds2: TDataSource;
    grd1: TDBGrid;
    ts2: TTabSheet;
    btn2: TButton;
    mmo2: TMemo;
    procedure btn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function TV(ATableName,X,Y: string): string;
  end;

var
  frmqkScriptTest: TfrmqkScriptTest;

implementation
uses
  qkSvrIntf.ClientIntf, qkFunc.Commfunc;

  var
  Lua: TqkScript;
{$R *.dfm}


function TfrmqkScriptTest.TV(ATableName,X,Y: string): string;
var
  LSql: string;
begin
  LSql := 'SELECT * FROM gBase_2DTable WHERE TName=' + ATableName.QuotedString;
  if qkDataIntf.SqlOpen('',LSql,nil,nil,LSql) then//repalce
  begin
    if mt1.IsEmpty then
    begin
      ShowMessage('没有找到表格：' + ATableName);
      Exit;
    end else
    begin

    end;
  end else
  begin

  end;

//  LSql := 'SELECT gBase_2DTable_Detail.TValue FROM gBase_2DTable ' +
//          ' INNER JOIN gBase_2DTable_Detail on gBase_2DTable.IDKey = gBase_2DTable_Detail.Parent_Ptr' +
//          ' WHERE gBase_2DTable.TName = '+ ATableName.QuotedString +
//          ' AND gBase_2DTable_Detail.X = ' + x.QuotedString +
//          ' AND gBase_2DTable_Detail.Y = ' + y.QuotedString;
//  LDs := TFDMemTable.Create(nil);
//  try
//    if qkDataIntf.DirectSqlOpen(LDs,LSql) then
//    begin
//      Result := LDs.FieldByName('TValue').AsString;
//    end else
//      Exit;
//  finally
//    LDs.Free;
//  end;
//  LDs.Data

end;


procedure TfrmqkScriptTest.btn1Click(Sender: TObject);

begin

  try
//    Lua.Reset;
//    Lua.AddCode(mmo1.Lines.Text);
//    Lua.Exec;
//    Lua.FUseArr := 'Data.DB,Dialogs';
//    Lua.AddUses;

  finally

  end;
end;

procedure TfrmqkScriptTest.btn2Click(Sender: TObject);
var
  Lret: string;
begin
  if Lua.ExecFunc(mmo2.Lines.Text,Lret) then
    ShowMessage(Lret);
end;

procedure TfrmqkScriptTest.FormCreate(Sender: TObject);
begin
  Lua := TqkScript.Create;
  Lua.FUseArr := ['Dialogs','SysUtils','qkImport'];
  Lua.FFuncUseForArr := [0];
  Lua.Init;
//  Lua.FRegisterGCallBack :=
//    function (AUnit: string;out VarName: string;out pVar: Pointer): Boolean
//    begin
//      if CompareText('TestQkScript',AUnit) = 0 then
//      begin
//        VarName := 'frmqkScriptTest: TfrmqkScriptTest';
//        pVar := @frmqkScriptTest;
//        Result := True;
//        //
//      end else
//      if CompareText('qkFunc.Commfunc',AUnit) = 0 then
//      begin
//        VarName := 'qkDataIntf: TqkDataIntf';
//        pVar := @qkDataIntf;
//        Result := True;
//        //
//      end else
//        Result := False;
//    end;

  //FScriptHelper := TqkScriptHelper.Create;
  //FScriptHelper.FUseArr := ['Dialogs','SysUtils'];
end;

procedure TfrmqkScriptTest.FormDestroy(Sender: TObject);
begin
  Lua.Free;
  //FScriptHelper.Free;
end;

end.
