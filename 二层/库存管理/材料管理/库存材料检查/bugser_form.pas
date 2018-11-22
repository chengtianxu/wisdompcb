unit bugser_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TForm_bugser = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    DBGrid1: TDBGrid;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery1code: TStringField;
    ADOQuery1reject_description: TStringField;
    ADOQuery1RKEY: TIntegerField;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_bugser: TForm_bugser;

implementation

uses damo,main;
{$R *.dfm}

procedure TForm_bugser.Button2Click(Sender: TObject);
begin
self.Close;
end;

procedure TForm_bugser.Button1Click(Sender: TObject);
begin
  modalresult:=mrok;
end;

procedure TForm_bugser.BitBtn1Click(Sender: TObject);
begin
edit1.Text:='';
edit1.SetFocus;
end;

procedure TForm_bugser.Edit1Change(Sender: TObject);
begin
if trim(edit1.Text)<>'' then
 begin
  if trim(label1.Caption)='»±œ›±‡∫≈:'  then
   self.ADOQuery1.Filter:='code like '''+trim(edit1.Text)+'%'''
   else
   self.ADOQuery1.Filter:='reject_description like '''+trim(edit1.Text)+'%''';
 end
 else
  self.ADOQuery1.Filter:='';
end;

procedure TForm_bugser.DBGrid1DblClick(Sender: TObject);
begin
modalresult:=mrok;
end;

procedure TForm_bugser.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then dbgrid1dblclick(sender);
end;

procedure TForm_bugser.DBGrid1TitleClick(Column: TColumn);
begin
 if column.FieldName<>'hzong' then
  begin
  dbgrid1.Columns[0].Title.color:=clbtnface;
  dbgrid1.Columns[1].Title.color:=clbtnface;
  if column.FieldName='code' then
  begin
   label1.Caption:='»±œ›±‡∫≈:';
   column.Title.Color:=clred;
   edit1.SetFocus;
   end
   else if column.FieldName='reject_description' then
  begin
   label1.Caption:='»±œ›√Ë ˆ:';
   column.Title.Color:=clred ;
   edit1.SetFocus;
  end;
 end;
end;


procedure TForm_bugser.FormCreate(Sender: TObject);
begin
adoquery1.Open;
end;

end.
