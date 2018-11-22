unit DefectsLib;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Grids, DBGrids, StdCtrls, Buttons, ADODB, ExtCtrls;

type
  TFrmDefectsLib = class(TForm)
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    Label1: TLabel;
    ADOQuery1RKEY: TIntegerField;
    ADOQuery1REJ_CODE: TStringField;
    ADOQuery1REJECT_DESCRIPTION: TStringField;
    ADOQuery1REJECT_DEFECT_FLAG: TStringField;
    ADOQuery1GRAPHIC_PATH: TStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
   field_name:string; 
  public
    { Public declarations }
  end;

var
  FrmDefectsLib: TFrmDefectsLib;

implementation
uses Main;
{$R *.DFM}

procedure TFrmDefectsLib.BitBtn1Click(Sender: TObject);
begin
 EDIT1.TEXT:='';
 edit1.SetFocus;
end;

procedure TFrmDefectsLib.BitBtn2Click(Sender: TObject);
begin
  if ADOQuery1.Eof then exit;
  Modalresult:=mrok;
end;

procedure TFrmDefectsLib.BitBtn3Click(Sender: TObject);
begin
  CLOSE;
end;

procedure TFrmDefectsLib.Edit1Change(Sender: TObject);
begin
  IF EDIT1.TEXT<>'' THEN
    Adoquery1.Filter :=field_name+' LIKE '''+TRIM(EDIT1.TEXT)+'%'''
  ELSE
    Adoquery1.Filter :='';
end;

procedure TFrmDefectsLib.FormShow(Sender: TObject);
begin
  Adoquery1.Open;
  Edit1.SetFocus ;
  field_name:='REJ_CODE';
end;

procedure TFrmDefectsLib.FormActivate(Sender: TObject);
begin
  Edit1.SetFocus;
end;

procedure TFrmDefectsLib.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
if adoquery1.IsEmpty then
 bitbtn2.Enabled:=false
else
 bitbtn2.Enabled:=true;
end;

procedure TFrmDefectsLib.DBGrid1TitleClick(Column: TColumn);
begin
if self.field_name<>column.FieldName then
 begin
  self.Label1.Caption:=column.Title.Caption;
  self.field_name:=column.FieldName;
  edit1.SetFocus;
 end;
end;

end.
