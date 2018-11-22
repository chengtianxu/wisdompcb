unit FindMatPriceUnit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFindUnit1, DB, ADODB, StdCtrls, Buttons, ExtCtrls, Grids,
  DBGridEh;

type
  TFindMatPriceForm2 = class(TBaseFindForm1)
    ADOStoredProc1CODE: TStringField;
    ADOStoredProc1ABBR_NAME: TStringField;
    ADOStoredProc1INV_PART_NUMBER: TStringField;
    ADOStoredProc1INV_NAME: TStringField;
    ADOStoredProc1INV_DESCRIPTION: TStringField;
    ADOStoredProc1QTE_PRICE1: TFloatField;
    ADOStoredProc1price1: TFloatField;
    ADOStoredProc1price2: TFloatField;
    ADOStoredProc1TDATE: TDateTimeField;
    ADOStoredProc1RKEY: TIntegerField;
    ADOStoredProc1d0017_rkey: TIntegerField;
    ADOStoredProc1UNIT_NAME: TStringField;
    ADOStoredProc1CURR_NAME: TStringField;
    ADOStoredProc1QTE_BASE_TO_OTHER: TFloatField;
    ADOStoredProc1qte_price2: TFloatField;
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
  FindMatPriceForm2: TFindMatPriceForm2;

implementation

{$R *.dfm}

procedure TFindMatPriceForm2.Edit1Change(Sender: TObject);
begin
  inherited;
  self.EditDataChange(sender,ADOStoredProc1,'CODE');
end;

procedure TFindMatPriceForm2.BitBtn1Click(Sender: TObject);
begin
  inherited;
  edit1.Text := '';
end;

procedure TFindMatPriceForm2.Temp_DBGridEh1DblClick(Sender: TObject);
begin
  inherited;
  Button1Click(sender);
end;

procedure TFindMatPriceForm2.Temp_DBGridEh1TitleBtnClick(Sender: TObject;
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

procedure TFindMatPriceForm2.Button1Click(Sender: TObject);
begin
  if  ADOStoredProc1.RecordCount > 0 then
     inherited;
end;

end.
