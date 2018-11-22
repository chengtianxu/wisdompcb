unit empl_search;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Grids, DBGrids, Buttons, StdCtrls, ADODB;

type
  Tform_technics = class(TForm)
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Edit1: TEdit;
    SpeedButton1: TSpeedButton;
    DataSource1: TDataSource;
    Button1: TButton;
    Button2: TButton;
    ADOQuery1: TADOQuery;
    ADOQuery1RKEY: TIntegerField;
    ADOQuery1DEPT_CODE: TStringField;
    ADOQuery1DEPT_NAME: TStringField;
    procedure Edit1Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    field_name:string; 
  public
    { Public declarations }
  end;

var
  form_technics: Tform_technics;

implementation

uses main;

{$R *.DFM}


procedure Tform_technics.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
  Adoquery1.Filter :=field_name+' like ''%'+trim(edit1.text)+'%'''
 else
  Adoquery1.filter:='';
end;

procedure Tform_technics.SpeedButton1Click(Sender: TObject);
begin
 edit1.Text := '';
 edit1.setfocus;
end;

procedure Tform_technics.DBGrid1DblClick(Sender: TObject);
begin
if not adoquery1.IsEmpty then ModalResult:=mrOK;
end;

procedure Tform_technics.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not adoquery1.IsEmpty) then ModalResult:=mrOK;
end;

procedure Tform_technics.FormCreate(Sender: TObject);
begin
 adoquery1.Open;
 field_name:='DEPT_CODE';
end;

procedure Tform_technics.DBGrid1TitleClick(Column: TColumn);
begin
if column.FieldName<>self.field_name then
 begin
  label1.Caption:=column.Title.Caption;
  field_name:=column.FieldName;
  self.Edit1.SetFocus;
 end;
end;

procedure Tform_technics.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;  
end;

end.
