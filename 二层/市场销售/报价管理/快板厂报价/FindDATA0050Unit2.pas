unit FindDATA0050Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFindUnit1, DB, ADODB, StdCtrls, Buttons, ExtCtrls, Grids,
  DBGridEh;

type
  TFindDATA0050Form2 = class(TBaseFindForm1)
    ADOStoredProc1RKEY: TIntegerField;
    ADOStoredProc1CUST_CODE: TStringField;
    RadioGroup1: TRadioGroup;
    ADOStoredProc1MANU_PART_NUMBER: TStringField;
    ADOStoredProc1MANU_PART_DESC: TStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Temp_DBGridEh1DblClick(Sender: TObject);
    procedure Temp_DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure FormCreate(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    vindex : integer;
  public
    { Public declarations }
  end;

var
  FindDATA0050Form2: TFindDATA0050Form2;

implementation

{$R *.dfm}

procedure TFindDATA0050Form2.BitBtn1Click(Sender: TObject);
begin
   inherited;
   edit1.Text := '' ;
end;

procedure TFindDATA0050Form2.Edit1Change(Sender: TObject);
begin
  inherited;
  self.EditDataChange(sender,ADOStoredProc1,'CUSTOMER_PART_NUMBER');
end;

procedure TFindDATA0050Form2.Temp_DBGridEh1DblClick(Sender: TObject);
begin
  inherited;
  Button1Click(sender);
end;

procedure TFindDATA0050Form2.Temp_DBGridEh1TitleBtnClick(Sender: TObject;
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

procedure TFindDATA0050Form2.FormCreate(Sender: TObject);
begin
  inherited;
  vindex := 2 ;
end;

procedure TFindDATA0050Form2.RadioGroup1Click(Sender: TObject);
begin
  inherited;
  if radiogroup1.ItemIndex <>vindex then
      begin
           vindex := radiogroup1.ItemIndex;
           with  ADOStoredProc1 do
               begin
                    if Active then close;
                    Parameters.ParamValues['@TTYPE'] := vindex;
                    Prepared := true ;
                    Open ;
               end;
      end;
end;

procedure TFindDATA0050Form2.FormShow(Sender: TObject);
begin
  inherited;
   with  ADOStoredProc1 do
       begin
            if Active then close;
            Parameters.ParamValues['@TTYPE'] := 2 ;
            Prepared := true ;
            Open ;
       end;

end;

procedure TFindDATA0050Form2.Button1Click(Sender: TObject);
begin
  if  ADOStoredProc1.RecordCount > 0 then
      inherited;

end;

end.
