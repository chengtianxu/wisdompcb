unit FindData0009Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFindUnit1, DB, ADODB, StdCtrls, Buttons, ExtCtrls, Grids,
  DBGridEh;

type
  TFindData0009Form3 = class(TBaseFindForm1)
    ADOStoredProc1RKEY: TIntegerField;
    ADOStoredProc1REP_CODE: TStringField;
    ADOStoredProc1SALES_REP_NAME: TStringField;
    ADOStoredProc1ABBR_NAME: TStringField;
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Temp_DBGridEh1DblClick(Sender: TObject);
    procedure Temp_DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
                                          Column: TColumnEh);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FindData0009Form3: TFindData0009Form3;

implementation

{$R *.dfm}

procedure TFindData0009Form3.Button1Click(Sender: TObject);
begin
  if  ADOStoredProc1.RecordCount > 0 then
      inherited;

end;

procedure TFindData0009Form3.BitBtn1Click(Sender: TObject);
begin
  inherited;
  edit1.Text := '' ;
end;

procedure TFindData0009Form3.Edit1Change(Sender: TObject);
begin
  inherited;
  self.EditDataChange(sender,ADOStoredProc1,'REP_CODE');
end;

procedure TFindData0009Form3.Temp_DBGridEh1DblClick(Sender: TObject);
begin
  inherited;
  Button1Click(sender);
end;

procedure TFindData0009Form3.Temp_DBGridEh1TitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
begin
  inherited;
  if not Temp_DBGridEh1.DataSource.DataSet.Active then exit;
  //如果只有一条记录不存在排序的问题
  if Temp_DBGridEh1.DataSource.DataSet.RecordCount <= 1 then exit;
  // self.TitleBtnSort1(sender,acol,column,adoquery,1)
  TitleBtnSort1(sender,acol,column,ADOStoredProc1);
  Label1.Caption :=self.vColumn1.Title.Caption;

end;

end.
