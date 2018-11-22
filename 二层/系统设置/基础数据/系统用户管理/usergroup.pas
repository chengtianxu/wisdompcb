unit usergroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, Grids, DBGridEh, ADODB, Buttons;

type
  TForm_group = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    ads73: TADODataSet;
    DataSource1: TDataSource;
    DBGridEh1: TDBGridEh;
    ads73rkey: TIntegerField;
    ads73USER_LOGIN_NAME: TStringField;
    ads73USER_FULL_NAME: TStringField;
    ads73message_flag: TBooleanField;
    Button1: TButton;
    Button2: TButton;
    BitBtn2: TBitBtn;
    ads73hrpopm: TIntegerField;
    ads73hr_qs: TStringField;
    ads73warehouse_ptr: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  PreColumn: TColumnEh;
  field_name:string;    
  public
    { Public declarations }
  end;

var
  Form_group: TForm_group;

implementation

uses DAMO;

{$R *.dfm}

procedure TForm_group.FormCreate(Sender: TObject);
begin

 field_name := DBGridEh1.Columns[0].FieldName;
 PreColumn := DBGridEh1.Columns[0];
end;

procedure TForm_group.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
if ads73.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

procedure TForm_group.Edit1Change(Sender: TObject);
begin
if trim(Edit1.text)<>'' then
 ads73.Filter :=field_name+' like ''%'+Trim(Edit1.Text)+'%'''
else
 ads73.filter:='';
end;

procedure TForm_group.BitBtn2Click(Sender: TObject);
begin
 edit1.Text := '';
 edit1.SetFocus;
end;

procedure TForm_group.DBGridEh1DblClick(Sender: TObject);
begin
if not ads73.IsEmpty then  modalresult:=mrok;
end;

procedure TForm_group.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=13) and (not ads73.IsEmpty) then  modalresult:=mrok;
end;

procedure TForm_group.DBGridEh1TitleClick(Column: TColumnEh);
begin
if (column.ReadOnly) and (column.FieldName<>self.field_name) then
 begin
  label1.Caption:=column.Title.Caption;
  field_name:=column.FieldName;
  ads73.IndexFieldNames:=column.FieldName;
  PreColumn.Title.Color := clBtnFace;
  PreColumn := column;
  Column.Title.Color := clred;
  self.Edit1.SetFocus;
 end
else
 self.Edit1.SetFocus;
end;

procedure TForm_group.FormActivate(Sender: TObject);
begin
self.ads73.Open;
end;

end.
