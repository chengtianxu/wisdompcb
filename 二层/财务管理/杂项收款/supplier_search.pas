unit supplier_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, Grids, DBGrids, ExtCtrls;

type
  TForm_inex = class(TForm)
    Button1: TButton;
    Button2: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Panel1: TPanel;
    Button3: TButton;
    Button4: TButton;
    ADOData0023: TADOQuery;
    ADOData0023RKEY: TIntegerField;
    ADOData0023TTYPE: TSmallintField;
    ADOData0023NAME: TStringField;
    ADOData0023DESCRIPTION: TStringField;
    ADOData0023GL_ACCT_PTR: TIntegerField;
    Panel2: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
    field_name:string;
  public
    { Public declarations }
  end;

var
  Form_inex: TForm_inex;

implementation

uses damo;

{$R *.dfm}

procedure TForm_inex.BitBtn1Click(Sender: TObject);
begin
 edit1.Text:='';
 edit1.SetFocus;
end;

procedure TForm_inex.Edit1Change(Sender: TObject);
begin

     if trim(Edit1.text)<>'' then
       ADOData0023.Filter:=field_name+' like '''+trim(edit1.text)+'%'''
     ELSE
       ADOData0023.FILTER:='';

 if adodata0023.IsEmpty then
  button3.Enabled:=false
 else
  button3.Enabled:=true;  
end;

procedure TForm_inex.DBGrid1DblClick(Sender: TObject);
begin
if not self.ADOData0023.IsEmpty then ModalResult:=mrok;
end;

procedure TForm_inex.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not self.ADOData0023.IsEmpty) then ModalResult:=mrok;
end;

procedure TForm_inex.FormCreate(Sender: TObject);
begin
  ADOData0023.open;
  field_name:='NAME';
 if adodata0023.IsEmpty then
  button3.Enabled:=false
 else
  button3.Enabled:=true;
end;

procedure TForm_inex.DBGrid1TitleClick(Column: TColumn);
begin
if column.FieldName<>self.field_name then
 begin
  label1.Caption:=column.Title.Caption;
  field_name:=column.FieldName;

  self.Edit1.SetFocus;
 end;
end;

end.
