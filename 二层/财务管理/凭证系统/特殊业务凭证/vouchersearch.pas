unit vouchersearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Spin, Grids, DBGridEh, DB, ADODB, Buttons;

type
  TForm_vouchersearch = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    SpinEdit1: TSpinEdit;
    Label3: TLabel;
    SpinEdit2: TSpinEdit;
    Edit1: TEdit;
    Label1: TLabel;
    DataSource1: TDataSource;
    ADs105: TADODataSet;
    ADs105RKEY: TIntegerField;
    ADs105VOUCHER: TStringField;
    ADs105ENTERED_DT: TDateTimeField;
    ADs105FYEAR: TIntegerField;
    ADs105PERIOD: TSmallintField;
    ADs105EMPLOYEE_NAME: TStringField;
    ADs105ATTACHED: TSmallintField;
    ADs105SPECIAL_POSTING: TStringField;
    ADs105BATCH_NUMBER: TStringField;
    ADs105v_status: TStringField;
    DBGridEh1: TDBGridEh;
    DataSource2: TDataSource;
    ads106: TADODataSet;
    ads106GL_ACC_NUMBER: TStringField;
    ads106CURR_NAME: TStringField;
    ads106curr_code: TStringField;
    ads106GL_HEADER_PTR: TIntegerField;
    ads106RKEY: TIntegerField;
    ads106GL_ACCT_NO_PTR: TIntegerField;
    ads106REF_NUMBER: TStringField;
    ads106DESCRIPTION: TStringField;
    ads106SRCE_PTR: TIntegerField;
    ads106AMOUNT: TBCDField;
    ads106D_C: TStringField;
    ads106description_2: TStringField;
    DBGridEh2: TDBGridEh;
    Splitter1: TSplitter;
    BitBtn1: TBitBtn;
    ads106CURR_PTR: TIntegerField;
    CheckBox1: TCheckBox;
    ads106fu_amount: TBCDField;
    ads106exch_rate: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1DblClick(Sender: TObject);
  private
    { Private declarations }
    PreColumn: TColumneh;
  public
    { Public declarations }
  end;

var
  Form_vouchersearch: TForm_vouchersearch;

implementation

uses Datamodule;

{$R *.dfm}

procedure TForm_vouchersearch.FormCreate(Sender: TObject);
begin
self.SpinEdit1.OnChange:=nil;
self.SpinEdit2.OnChange:=nil;
self.SpinEdit1.Value:=dm.ADOData0508CURR_FYEAR.Value;
self.SpinEdit2.Value:=dm.ADOData0508CURR_PERIOD.Value;
self.ADs105.Close;
self.ADs105.Parameters[0].Value:=SpinEdit1.Value;
self.ADs105.Parameters[1].Value:=spinedit2.Value;
self.ADs105.Prepared;
self.ADs105.Open;
self.ads106.Close;
self.ADs106.Prepared;
self.ADs106.Open;
self.SpinEdit1.OnChange:=SpinEdit1Change;
self.SpinEdit2.OnChange:=SpinEdit1Change;
PreColumn := DBGrideh1.Columns[0];
end;

procedure TForm_vouchersearch.SpinEdit1Change(Sender: TObject);
begin
self.ADs105.Close;
self.ADs105.Parameters[0].Value:=SpinEdit1.Value;
self.ADs105.Parameters[1].Value:=spinedit2.Value;
self.ADs105.Prepared;
self.ADs105.Open;
self.ads106.Close;
self.ADs106.Prepared;
self.ADs106.Open;
end;

procedure TForm_vouchersearch.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
  ADs105.Filter := PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
 else
  ADs105.filter := '';
end;

procedure TForm_vouchersearch.DBGridEh1TitleClick(Column: TColumnEh);
begin
 if column.Title.SortMarker =smDownEh then
  begin
   column.Title.SortMarker:=smUpEh;
   ads105.IndexFieldNames:=Column.FieldName;
  end
 else
  begin
   column.Title.SortMarker:=smDownEh;
   ads105.IndexFieldNames:=Column.FieldName+' DESC';
  end;

if (column.ReadOnly) and (PreColumn.FieldName<>column.FieldName) then
 begin
  label1.Caption:=column.Title.Caption;
  edit1.SetFocus;
  PreColumn.Title.Color := clBtnFace;
  Column.Title.Color := clred;
  PreColumn := column;
 end
else
 edit1.SetFocus;

  
end;

procedure TForm_vouchersearch.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(ADs105.CommandText);
end;

procedure TForm_vouchersearch.DBGridEh1DblClick(Sender: TObject);
begin
if not self.ADs105.IsEmpty then ModalResult:=mrok;
end;

end.
