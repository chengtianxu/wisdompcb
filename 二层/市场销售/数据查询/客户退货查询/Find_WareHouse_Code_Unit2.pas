unit Find_WareHouse_Code_Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, findUnit1, DB, ADODB, StdCtrls, Buttons, ExtCtrls, Grids,
  DBGridEh;

type
  TFind_WareHouse_Code_Form2 = class(TfindForm1)
    ADOStoredProc1RKEY: TIntegerField;
    ADOStoredProc1WAREHOUSE_CODE: TStringField;
    ADOStoredProc1WAREHOUSE_NAME: TStringField;
    ADOStoredProc1ABBR_NAME: TStringField;
    procedure Edit1Change(Sender: TObject);
    procedure Temp_DBGridEh1DblClick(Sender: TObject);
    procedure Temp_DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Find_WareHouse_Code_Form2: TFind_WareHouse_Code_Form2;

implementation

{$R *.dfm}

procedure TFind_WareHouse_Code_Form2.Edit1Change(Sender: TObject);
begin
  inherited;
  self.EditDataChange(sender,ADOStoredProc1,'WareHouse_Code');
end;

procedure TFind_WareHouse_Code_Form2.Temp_DBGridEh1DblClick(
  Sender: TObject);
begin
  inherited;
  if ADOStoredProc1.RecordCount >0 then
     Button1Click(sender);
end;

procedure TFind_WareHouse_Code_Form2.Temp_DBGridEh1TitleBtnClick(
  Sender: TObject; ACol: Integer; Column: TColumnEh);
begin
  inherited;
  if not Temp_DBGridEh1.DataSource.DataSet.Active then exit;
  //如果只有一条记录不存在排序的问题
  if Temp_DBGridEh1.DataSource.DataSet.RecordCount <= 1 then exit;
  // self.TitleBtnSort1(sender,acol,column,adoquery,1)
  TitleBtnSort1(sender,acol,column,ADOStoredProc1);

  Label1.Caption :=self.vColumn1.Title.Caption;
end;

procedure TFind_WareHouse_Code_Form2.Button1Click(Sender: TObject);
begin
  if ADOStoredProc1.RecordCount >0 then
    inherited;
end;

end.
