unit mrb_remark;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, ExtCtrls, DB, ADODB, StdCtrls, Buttons;

type
  TForm_MRBREMARK = class(TForm)
    ads414: TADODataSet;
    DataSource1: TDataSource;
    ads414rkey: TIntegerField;
    ads414custpart_ptr: TIntegerField;
    ads414number: TStringField;
    ads414sys_date: TDateTimeField;
    ads414CUST_CODE: TStringField;
    ads414MANU_PART_NUMBER: TStringField;
    ads414MANU_PART_DESC: TStringField;
    ads414qty_to_be_remaked: TIntegerField;
    ads414ABBR_NAME: TStringField;
    Panel1: TPanel;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn3: TBitBtn;
    ads414MI_status: TStringField;
    ads414OPT_LOT_SIZE: TIntegerField;
    ads414EST_SCRAP: TFloatField;
    BitBtn4: TBitBtn;
    ads414status: TWordField;
    ads414qty_to_be_reworked: TIntegerField;
    ads414QTY_REWORKED: TIntegerField;
    ads414QTY_REMAKED: TIntegerField;
    ads414CUSTOMER_PTR: TIntegerField;
    procedure BitBtn3Click(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure FormActivate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
    PreColumn: TColumnEh;
  public
    { Public declarations }
  end;

var
  Form_MRBREMARK: TForm_MRBREMARK;

implementation

uses damo;

{$R *.dfm}

procedure TForm_MRBREMARK.BitBtn3Click(Sender: TObject);
begin
edit1.Text:='';
end;

procedure TForm_MRBREMARK.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
if ads414.IsEmpty then
begin
 bitbtn1.Enabled := false;
 bitbtn4.Enabled := false;
end
else
begin
 bitbtn1.Enabled := true;
 bitbtn4.Enabled := true; 
end;
end;

procedure TForm_MRBREMARK.FormActivate(Sender: TObject);
begin
 self.ads414.Open;
 PreColumn := DBGridEH1.Columns[0];
end;

procedure TForm_MRBREMARK.Edit1Change(Sender: TObject);
begin
if (trim(edit1.Text)<> '')  then
 ADS414.Filter:=PreColumn.FieldName+' like ''%'+trim(edit1.Text)+'%'''
else
 ADS414.Filter:='';
end;

procedure TForm_MRBREMARK.DBGridEh1TitleClick(Column: TColumnEh);
begin
 if column.Title.SortMarker =smDownEh then
  begin
   column.Title.SortMarker:=smUpEh;
   ads414.IndexFieldNames:=Column.FieldName;
  end
 else
  begin
   column.Title.SortMarker:=smDownEh;
   ads414.IndexFieldNames:=Column.FieldName+' DESC';
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

procedure TForm_MRBREMARK.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(ads414.CommandText);

if (key=13) and (not ads414.IsEmpty) then  modalresult:=mrok;
end;

procedure TForm_MRBREMARK.DBGridEh1DblClick(Sender: TObject);
begin
if not ads414.IsEmpty then modalresult := mrok;
end;

procedure TForm_MRBREMARK.BitBtn4Click(Sender: TObject);
begin
self.ads414.Edit;
self.ads414QTY_REMAKED.Value:=self.ads414qty_to_be_remaked.Value;
if (ads414QTY_REWORKED.Value >= ads414qty_to_be_reworked.Value) and
   (ads414QTY_REMAKED.Value >= ads414qty_to_be_remaked.Value) then
self.ads414status.Value:=3;
self.ads414.Post;
self.ads414.Close;
self.ads414.Open;
end;

end.
