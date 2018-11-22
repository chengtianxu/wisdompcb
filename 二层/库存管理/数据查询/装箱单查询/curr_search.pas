unit curr_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons;

type
  Tform_empl = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery1EMPL_CODE: TStringField;
    ADOQuery1RKEY: TIntegerField;
    ADOQuery1EMPLOYEE_NAME: TStringField;
    ADOQuery1abbr_name: TStringField;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
    fieldname:string;
  public
    { Public declarations }
  end;

var
  form_empl: Tform_empl;

implementation

uses main;

{$R *.dfm}

procedure Tform_empl.DBGrid1DblClick(Sender: TObject);
begin
if not adoquery1.IsEmpty then
 ModalResult:=mrok;
end;

procedure Tform_empl.BitBtn1Click(Sender: TObject);
begin
 edit1.Text:='';
 edit1.SetFocus;
end;

procedure Tform_empl.Edit1Change(Sender: TObject);
begin
 IF trim(EDIT1.TEXT)<>'' THEN
  adoQUERY1.Filter:=fieldname+' like '''+trim(EDIT1.TEXT)+'%'''
 ELSE
  adoQUERY1.FILTER:='';
if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;  
end;

procedure Tform_empl.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not adoquery1.IsEmpty) then ModalResult:=mrok;
end;

procedure Tform_empl.FormCreate(Sender: TObject);
begin
 adoquery1.Open;
if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
fieldname:='EMPL_CODE';   
end;

procedure Tform_empl.DBGrid1TitleClick(Column: TColumn);
begin
if self.fieldname<>column.FieldName then
 begin
  label1.Caption:=column.Title.Caption;
  edit1.SetFocus;
  self.fieldname:=column.FieldName;
 end;
end;

end.
