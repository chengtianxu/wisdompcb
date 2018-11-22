unit Main5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, DB, ADODB, Menus,
  Mask, DBCtrls, ComCtrls,DateUtils;

type
  TFrmMain5 = class(TForm)
    Splitter1: TSplitter;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    ADOData0458: TADOQuery;
    DataSource1: TDataSource;
    StatusBar1: TStatusBar;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    ADODate: TADOQuery;
    Label2: TLabel;
    Edit1: TEdit;
    Label6: TLabel;
    ADOData0455: TADOQuery;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    MainMenu1: TMainMenu;
    IQC1: TMenuItem;
    IQC2: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    ADOData0458RKEY: TAutoIncField;
    ADOData0458DEPT_PTR: TIntegerField;
    ADOData0458INVENT_PTR: TIntegerField;
    ADOData0458BAL_QTY: TFloatField;
    ADOData0458LAST_DATE: TDateTimeField;
    ADOData0458dept_code: TStringField;
    ADOData0458dept_name: TStringField;
    ADOData0458inv_part_number: TStringField;
    ADOData0458inv_part_description: TStringField;
    ADOData0458unit_code: TStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Exit(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure IQC2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain5: TFrmMain5;

implementation

uses Mainmenu, Report3, AdjustDeptStock;
{$R *.dfm}

procedure TFrmMain5.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TFrmMain5.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then dbgrid1.SetFocus ;
end;

procedure TFrmMain5.Edit1Exit(Sender: TObject);
begin
  if trim(edit1.Text)<>'' then
    Adodata0458.Filter:='dept_code like '''+trim(edit1.text)+'%'''
  else
    Adodata0458.Filter:='';
end;

procedure TFrmMain5.N1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmAdjustDeptStock, FrmAdjustDeptStock);
  FrmAdjustDeptStock.Edit1.text:=Adodata0458.fieldbyname('bal_qty').asstring;
  if FrmAdjustDeptStock.showmodal=mrok then
  begin
    Adodata0455.append;
    Adodata0455.fieldbyname('dept_ptr').asstring:=Adodata0458.fieldbyname('dept_ptr').asstring;
    Adodata0455.fieldbyname('invent_ptr').asstring:=Adodata0458.fieldbyname('invent_ptr').asstring;
    Adodata0455.fieldbyname('conf_dif_qty').asfloat:=Adodata0458.fieldbyname('bal_qty').asfloat-strtofloat(FrmAdjustDeptStock.Edit1.text);
    Adodata0455.fieldbyname('conf_by').asstring:=Mainform.user_ptr.Caption ;
    Adodata0455.fieldbyname('conf_date').asstring:=Adodate.fieldbyname('vdt').asstring;
    Adodata0455.post;
    Adodata0458.Edit;
    Adodata0458.fieldbyname('bal_qty').asstring:=FrmAdjustDeptStock.Edit1.text ;
    Adodata0458.Post;
  end;
  FrmAdjustDeptStock.free;
end;

procedure TFrmMain5.FormCreate(Sender: TObject);
begin
  Adodata0458.Open ;
  Adodate.Open ;
  if Adodata0455.active=false then
    Adodata0455.Open ;
end;

procedure TFrmMain5.IQC2Click(Sender: TObject);
begin
  FrmReport3 := TFrmReport3.Create(Application);
  FrmReport3.QuickRep1.Preview ;
  FrmReport3.Free ;
end;

end.
