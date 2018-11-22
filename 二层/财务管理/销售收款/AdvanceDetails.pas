unit AdvanceDetails;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Grids, DBGridEh, ExtCtrls, DB, ADODB;

type
  TFrm_AdvanceDetails = class(TForm)
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    dtpk1: TDateTimePicker;
    Label3: TLabel;
    dtpk2: TDateTimePicker;
    ADO152: TADODataSet;
    DS152: TDataSource;
    ADO152reference_no: TStringField;
    ADO152tdate: TDateTimeField;
    ADO152cust_code: TStringField;
    ADO152abbr_name: TStringField;
    ADO152curr_code: TStringField;
    ADO152po_number: TStringField;
    ADO152manu_part_number: TStringField;
    ADO152amount: TBCDField;
    ADO152all_shipqty: TIntegerField;
    ADO152REMARK: TStringField;
    ADO152unit_sq: TFloatField;
    ADO152PARTS_ORDERED: TFloatField;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dtpk1Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
    preColumn:TColumnEh;
  public
    { Public declarations }
  end;

var
  Frm_AdvanceDetails: TFrm_AdvanceDetails;

implementation

uses DAMO, main, common;

{$R *.dfm}

procedure TFrm_AdvanceDetails.Button2Click(Sender: TObject);
begin
  if not ADO152.IsEmpty then
    Export_dbGridEH_to_Excel(DBGridEh1,Application.Title);
end;

procedure TFrm_AdvanceDetails.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrm_AdvanceDetails.FormShow(Sender: TObject);
begin
  preColumn:=DBGridEh1.Columns[0];
  Label1.Caption:=preColumn.Title.Caption;
end;

procedure TFrm_AdvanceDetails.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if Column.Title.SortMarker=smUpEh then
  begin
    Column.Title.SortMarker:=smDownEh;
    ADO152.IndexFieldNames:=Column.FieldName+' DESC';
  end
  else
  begin
    Column.Title.SortMarker:=smUpEh;
    ADO152.IndexFieldNames:=Column.FieldName;
  end;
  if Column.Tag<>1 then
  begin
    if Column.FieldName<>preColumn.FieldName then
    begin
      Label1.Caption:=Column.Title.Caption;
      Column.Title.Color:=clRed;
      preColumn.Title.Color:=clBtnFace;
      preColumn:=Column;
      Edit1.SetFocus;
      Edit1.Text:='';
    end;
  end;
end;

procedure TFrm_AdvanceDetails.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(ADO152.CommandText);
end;

procedure TFrm_AdvanceDetails.dtpk1Change(Sender: TObject);
begin
  WITH ADO152 do
  begin
    Close;
    parameters.ParamByName('vdate1').Value:=FormatDateTime('YYYY-MM-DD',dtpk1.Date);
    parameters.ParamByName('vdate2').Value:=FormatDateTime('YYYY-MM-DD',dtpk2.Date+1);
    Prepared;
    Open;
  end;
  ADO152.Open;
end;

procedure TFrm_AdvanceDetails.Edit1Change(Sender: TObject);
begin
  if Trim(Edit1.Text)<>'' then
    ADO152.Filter:=preColumn.FieldName+' like ''%'+trim(Edit1.Text)+'%'''
  else
    ADO152.Filter:='';
end;

end.
