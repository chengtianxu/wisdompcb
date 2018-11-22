unit PasCycleAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfrmDes = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    cbbCycle: TComboBox;
    edtType: TEdit;
    btn1: TBitBtn;
    btn2: TBitBtn;
    btn3: TBitBtn;
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDes: TfrmDes;

implementation

uses DEMO,Pick_Item_Single,ConstVar;

{$R *.dfm}

procedure TfrmDes.btn2Click(Sender: TObject);
begin
  if Trim(edtType.Text) = '' then
  begin
    ShowMessage('材料类别不能为空');
    Exit;
  end;
  if cbbCycle.ItemIndex = -1 then
  begin
    ShowMessage('请选择检测周期');
    Exit;
  end;
  with DM.qrytmp do
  begin
    Close;
    SQL.Text:='insert into Data0621 values('+ IntToStr(edtType.Tag)
              +','+ IntToStr(cbbCycle.ItemIndex + 1)+')';
    ExecSQL;
  end;
  ModalResult:= mrOk;
end;

procedure TfrmDes.btn1Click(Sender: TObject);
  var InputVar: PDlgInput ;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    InputVar.Fields := 'GROUP_NAME/类别编号/120,GROUP_DESC/类别名称/250';
    InputVar.Sqlstr := 'select rKey,GROUP_NAME,GROUP_DESC from data0496 order by GROUP_NAME';
    inputvar.KeyField:='GROUP_NAME';

    InputVar.AdoConn := dm.con1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
       edtType.Text:=frmPick_Item_Single.adsPick.fieldbyname('GROUP_NAME').AsString;
       edtType.Tag:= frmPick_Item_Single.adsPick.fieldbyname('rkey').AsInteger;
  finally
    frmPick_Item_Single.Free;
  end;
end;

end.
