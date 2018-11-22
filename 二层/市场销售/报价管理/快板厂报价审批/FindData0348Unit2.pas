unit FindData0348Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFindUnit1, DB, ADODB, StdCtrls, Buttons, ExtCtrls, Grids,
  DBGridEh;

type
  TFindData0348Form2 = class(TBaseFindForm1)
    ADOStoredProc1RKEY: TIntegerField;
    ADOStoredProc1TTYPE: TSmallintField;
    ADOStoredProc1ADDER_NAME: TStringField;
    ADOStoredProc1FORMULA: TMemoField;
    ADOStoredProc1SELECTED: TSmallintField;
    ADOStoredProc1PCENTS: TWordField;
    ADOStoredProc1MIN_VALUE: TMemoField;
    ADOStoredProc1MAX_VALUE: TMemoField;
    ADOStoredProc1DFT_SELECTED: TWordField;
    ADOStoredProc1SPEC_RKEY: TStringField;
    ADOStoredProc1selectit: TBooleanField;
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
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
  FindData0348Form2: TFindData0348Form2;

implementation

uses
   DMUnit1  ;
{$R *.dfm}

procedure TFindData0348Form2.Edit1Change(Sender: TObject);
begin
  inherited;
  self.EditDataChange(sender,ADOStoredProc1,'ADDER_NAME');
end;

procedure TFindData0348Form2.BitBtn1Click(Sender: TObject);
begin
  inherited;
  edit1.Text := '' ;
end;

procedure TFindData0348Form2.Temp_DBGridEh1DblClick(Sender: TObject);
begin
  inherited;
  Button1Click(sender);
end;

procedure TFindData0348Form2.Temp_DBGridEh1TitleBtnClick(Sender: TObject;
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

procedure TFindData0348Form2.Button1Click(Sender: TObject);
begin
  if  ADOStoredProc1.RecordCount > 0 then
      inherited;

end;

end.
