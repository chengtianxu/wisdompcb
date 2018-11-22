unit NProdRSEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, ToolWin, Buttons, StdCtrls,
  Grids, Menus, DB, ADODB, DBGrids, DBCtrls, Mask;

type
  TFrmNProdRSEdit = class(TForm)
    ToolBar1: TToolBar;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    tmpADO: TADOQuery;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmNProdRSEdit: TFrmNProdRSEdit;

implementation
uses prodRSDesign;

{$R *.dfm}

procedure TFrmNProdRSEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (FrmProdRSDesign.Adoquery1.State=dsInsert)
    or (FrmProdRSDesign.Adoquery1.Modified) then
     FrmProdRSDesign.Adoquery1.Cancel;
  Action:=caFree;
end;

procedure TFrmNProdRSEdit.SpeedButton7Click(Sender: TObject);
begin
  if trim(edit1.text)='' then
  begin
    MessageDlg('请输入代号！',mtInformation,[MbOk],0);
    edit1.SetFocus ;
    exit;
  end;
  if trim(edit3.text)='' then
  begin
    MessageDlg('请输入有效的税率！',mtInformation,[MbOk],0);
    edit3.SetFocus ;
    exit;
  end;
  if strtofloat(trim(edit3.text))<=0 then
  begin
    MessageDlg('请输入有效的税率！',mtInformation,[MbOk],0);
    edit3.SetFocus ;
    exit;
  end;
  try
    WITH FrmProdRSDesign.Adoquery1 do
    begin
      edit;
      Fieldbyname('state_id').asstring:=Edit1.Text;
      Fieldbyname('name').asstring:=Edit2.Text;
      Fieldbyname('STATE_TAX').asstring:=Edit3.Text;
      post;
    end;
   except
      FrmProdRSDesign.Adoquery1.Cancel ;
      MessageDlg('请检查该代号是否已经被使用！',mtInformation,[MbOk],0);
      edit1.SetFocus ;
      exit;
   end;
   ModalResult:=mrOk;
end;

procedure TFrmNProdRSEdit.SpeedButton6Click(Sender: TObject);
begin
  close;
end;

procedure TFrmNProdRSEdit.FormActivate(Sender: TObject);
begin
  Edit1.Text :=FrmProdRSDesign.Adoquery1.Fieldbyname('state_id').asstring;
  Edit2.Text :=FrmProdRSDesign.Adoquery1.Fieldbyname('name').asstring;
  Edit3.Text :=FrmProdRSDesign.Adoquery1.Fieldbyname('STATE_TAX').asstring;
end;

procedure TFrmNProdRSEdit.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9','.',#8]) then
    abort
  else
  begin
   if (key = chr(46)) then
    if pos('.',edit3.Text)>0
     then
      abort;
  end;
end;

end.

