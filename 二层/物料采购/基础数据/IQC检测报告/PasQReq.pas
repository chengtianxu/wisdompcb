unit PasQReq;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ComCtrls, ExtCtrls, StdCtrls, Buttons, Menus;

type
  TfrmQRep = class(TForm)
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    grpDate: TGroupBox;
    Label1: TLabel;
    dtpStart: TDateTimePicker;
    Label2: TLabel;
    dtpEnd: TDateTimePicker;
    GroupBox1: TGroupBox;
    lbl1: TLabel;
    edtCode: TEdit;
    btn1: TBitBtn;
    lbl2: TLabel;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    edtINVT: TEdit;
    BitBtn1: TBitBtn;
    lbl3: TLabel;
    rg1: TRadioGroup;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure edtCodeExit(Sender: TObject);
    procedure edtINVTExit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit1DblClick(Sender: TObject);
    procedure edtCodeDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    KeyList:string;
    { Public declarations }

  end;

var
  frmQRep: TfrmQRep;

implementation

uses common, PasData, DAMo,Pick_Item_Single,ConstVar, PasSelect;

{$R *.dfm}

procedure TfrmQRep.FormShow(Sender: TObject);
var
   i:Integer;
   Year,Month,Day:Word;
begin
  dtpEnd.DateTime:= getsystem_date(DM.adoTmp,1);
  DecodeDate(dtpEnd.DateTime,Year,Month,Day);
  dtpStart.DateTime:= EncodeDate(Year,Month,01);
end;


procedure TfrmQRep.btnOkClick(Sender: TObject);
begin
  frmData:=TfrmData.Create(nil);
  try
    frmData.LCode:= KeyList;
    frmData.LINVT:= edtINVT.Tag;
    frmData.dtp1.Date:=  dtpStart.Date;
    frmData.dtp2.Date:= dtpEnd.Date;
    frmData.LSDate:= dtpStart.Date;
    frmData.LEDate:= dtpEnd.Date;
    frmData.LMod:= rg1.ItemIndex;
    frmData.LGroupID:= Edit1.Tag;
    frmData.ShowModal;
  finally
    frmData.Free;
  end;

end;

procedure TfrmQRep.btn1Click(Sender: TObject);
var
  Lfrm:TfrmSelect;
begin
  Lfrm:= TfrmSelect.Create(Self);
  try
    Lfrm.SelectType:=1;
    if Lfrm.ShowModal=mryes then
    begin
      edtCode.Text:='';
      KeyList:='';
      with Lfrm.adoSelect do
      begin
        First;
        while not Eof do
        begin
          edtCode.Text:=FieldByName('供应商代码').asstring + ','+ edtCode.Text ;
          KeyList:= FieldByName('rkey').asstring + ','+ KeyList;
//          keyList.Add(FieldByName('').asstring + '=' + FieldByName('rkey').AsString);
          Next;
        end;
      end;
      edtCode.Text:=Copy(edtCode.Text,0,Length(edtCode.Text)-1);
      KeyList:= Copy(KeyList,0,Length(KeyList)-1);
    end;
  finally
    Lfrm.Free;
  end;
end;

procedure TfrmQRep.BitBtn1Click(Sender: TObject);
var
  InputVar:PDlgInput;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    InputVar.Fields := 'INV_PART_NUMBER/材料编码/180,INV_NAME/材料名称/250';
    if Edit1.Tag <>0 then InputVar.Sqlstr := 'select rkey,INV_PART_NUMBER,INV_NAME from data0017 where inspect = ''Y'' and group_ptr = '+ IntToStr(Edit1.Tag) +' order by INV_PART_NUMBER'
    else InputVar.Sqlstr := 'select rkey,INV_PART_NUMBER,INV_NAME from data0017 where inspect = ''Y'' order by INV_PART_NUMBER';
    Inputvar.KeyField:='';

    InputVar.AdoConn := dm.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edtINVT.Text:= frmPick_Item_Single.adsPick.fieldbyname('INV_PART_NUMBER').AsString;
      Label4.Caption:= frmPick_Item_Single.adsPick.fieldbyname('INV_NAME').AsString;
      edtINVT.Tag:=frmPick_Item_Single.adsPick.fieldbyname('rKey').AsInteger;
    end;
  finally
    frmPick_Item_Single.Free;
  end;
end;

procedure TfrmQRep.edtCodeExit(Sender: TObject);
begin
  if Trim(edtCode.Text) = '' then KeyList:= '';
end;

procedure TfrmQRep.edtINVTExit(Sender: TObject);
begin
  if Trim(edtINVT.Text) = '' then  edtINVT.Tag:= 0;
end;

procedure TfrmQRep.BitBtn2Click(Sender: TObject);
var
  InputVar:PDlgInput;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    InputVar.Fields := 'GROUP_NAME/类别代码/180,GROUP_DESC/类别名称/250';
    InputVar.Sqlstr := 'select rkey,GROUP_NAME,GROUP_DESC from data0496  order by GROUP_NAME';
    Inputvar.KeyField:='';

    InputVar.AdoConn := dm.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      Edit1.Text:= frmPick_Item_Single.adsPick.fieldbyname('GROUP_NAME').AsString;
//      Label4.Caption:= frmPick_Item_Single.adsPick.fieldbyname('INV_NAME').AsString;
      Edit1.Tag:=frmPick_Item_Single.adsPick.fieldbyname('rKey').AsInteger;
    end;
  finally
    frmPick_Item_Single.Free;
  end;
end;

procedure TfrmQRep.Edit1DblClick(Sender: TObject);
begin
  (Sender as TEdit).Text:= '';
  (Sender as TEdit).Tag:= 0;
end;

procedure TfrmQRep.edtCodeDblClick(Sender: TObject);
begin
  (Sender as TEdit).Text:= '';
  KeyList:= '';
  Label4.Caption:='';
end;

end.
