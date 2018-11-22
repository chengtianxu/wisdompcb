unit CustP_Search;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, DBCtrls, Grids, DBGrids, Db, DBTables, ComCtrls,
  Menus, ADODB, ExtCtrls;

type
  TFrmCustPart = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Edit1: TEdit;
    BitBtn3: TBitBtn;
    Splitter1: TSplitter;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    RadioGroup1: TRadioGroup;
    ADOQuery1: TADOQuery;
    ADOQuery1rkey: TIntegerField;
    ADOQuery1manu_part_number: TStringField;
    ADOQuery1manu_part_desc: TStringField;
    ADOQuery1bath_former: TStringField;
    ADOQuery1qty_on_hand: TIntegerField;
    procedure FormActivate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
   private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCustPart: TFrmCustPart;

implementation
uses main;
{$R *.DFM}

procedure TFrmCustPart.FormActivate(Sender: TObject);
begin
 edit1.SetFocus;  //在程序开始时edit1得到焦点
end;

procedure TFrmCustPart.Edit1Change(Sender: TObject);
var
  vstring:string;
begin
  if Radiogroup1.ItemIndex=0 then
  begin
    if Edit1.text<>'' then vstring :='manu_part_number like '''+edit1.Text+'%'''
      else vstring :='';
  end else
  begin
    if Edit1.text<>'' then vstring :='manu_part_desc like '''+edit1.Text+'%'''
      else vstring :='';
  end;
  Adoquery1.Filter:=vstring;
end;

procedure TFrmCustPart.Edit1Click(Sender: TObject);
begin
edit1.SelectAll; //选口所有的文本
end;

procedure TFrmCustPart.BitBtn3Click(Sender: TObject);
begin
  Edit1.text:='';
  Adoquery1.Filter :='';
  Edit1.SetFocus ;
end;

procedure TFrmCustPart.DBGrid1DblClick(Sender: TObject);
begin
if not adoquery1.IsEmpty then
  ModalResult:=mrOk;
end;

procedure TFrmCustPart.FormShow(Sender: TObject);
begin
  Adoquery1.Open;

end;

procedure TFrmCustPart.Button1Click(Sender: TObject);
begin
  if ADOQuery1.RecordCount>0 then
  Modalresult:=mrok;
end;

procedure TFrmCustPart.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

end.

