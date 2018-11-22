unit frmEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, StdCtrls, ExtCtrls, MainFrm, Buttons, ComCtrls;

type
  TForm2 = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    lbl1: TLabel;
    edtBCBH: TEdit;
    lbl2: TLabel;
    lbl3: TLabel;
    edtCAMVer: TDBEdit;
    lbl4: TLabel;
    edtCAMVer1: TDBEdit;
    btn1: TSpeedButton;
    btnSave: TButton;
    btn3: TButton;
    lbl5: TLabel;
    mmoTypeInfo: TMemo;
    cbxTypeDef: TComboBox;
    edtCAMDesc: TDBEdit;
    edtMatchID: TDBEdit;
    lbl6: TLabel;
    pgc1: TPageControl;
    ts1: TTabSheet;
    dbmmoCAMTxt: TDBMemo;
    ts2: TTabSheet;
    imgCAMImg: TDBImage;
    procedure btn1Click(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure cbxTypeDefChange(Sender: TObject);
    procedure mmoTypeInfoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  Pick_Item_Single, ConstVar, wz_gunit, DM;

{$R *.dfm}

procedure TForm2.btn1Click(Sender: TObject);
var
  LFrm: TfrmPick_Item_Single;
  LInPut: PDlgInput;
begin

  LFrm := TfrmPick_Item_Single.Create(Self);
  LInPut.AdoConn := dm1.con1;
  try
    LInPut.KeyField := 'MANU_PART_NUMBER';

    LInPut.Fields:= 'MANU_PART_NUMBER/本厂编号/89,MANU_PART_DESC/客户型号/149,'+
                       'ANALYSIS_CODE_2/客户物料号/116,CUST_CODE/客户代码/74,ABBR_NAME/客户简称/84';

    LInPut.Sqlstr := ' SELECT d25.rkey as rkey25,D25.MANU_PART_NUMBER, D25.ANALYSIS_CODE_2, D25.MANU_PART_DESC  FROM data0025 D25 ' +
                    ' WHERE D25.PARENT_PTR IS NULL ';
    if edtBCBH.Text <> '' then
    begin
      LInPut.Sqlstr := LInPut.Sqlstr + ' AND D25.MANU_PART_NUMBER LIKE ' + QuotedStr('%'+edtBCBH.Text+'%');
    end;

    LFrm.InitForm_New(LInPut);
    if LFrm.ShowModal = mrOK then
    begin
      edtBCBH.Text := LFrm.Get_Rslt;
      edtBCBH.Tag := LFrm.adsPick1.fieldbyname('rkey25').AsInteger;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TForm2.btnSaveClick(Sender: TObject);
begin
//  if (edtBCBH.Tag = 0) or (edtBCBH.Text = '') then
//  begin
//    ShowMessage('请选择本厂编号');
//    Exit;
//  end;
//  if edtCAMVer.Text = '' then
//  begin
//    ShowMessage('版本号不能为空');
//    Exit;
//  end;

  //Form1.ads1.FieldByName('d25_ptr').AsInteger := edtBCBH.Tag;
  //Form1.ads1.FieldByName('CAMName').AsString := edtBCBH.Text;
  //form1.ads1.FieldByName('ModiyTime').AsDateTime := Now();
  //Form1.ads1.FieldByName('ModiyUser').AsString := gUser.User_Ptr;
  //form1.ads1.FieldByName('MatchID').AsString := cbx1.Text;
  Form1.ads1.post;
  ModalResult := mrOk;
end;

procedure TForm2.btn3Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TForm2.cbxTypeDefChange(Sender: TObject);
begin
  with form1 do
  begin
    mmoTypeInfo.Lines.Clear;
    qrytmp.Close;
    qrytmp.SQL.Text := ' SELECT pd.PrintType,pd.PrintScripDesc FROM Print2D_BarDef pm ' +
      ' inner JOIN Print2D_BarDef_Detail pd ON Parent_IDKey = pm.IDKey ' +
      ' where pm.BarName = ' + QuotedStr(cbxTypeDef.Text);
    qrytmp.Open;
    qrytmp.First;
    while not qrytmp.Eof do
    begin
      mmoTypeInfo.Lines.Add(qrytmp.fieldbyname('PrintType').AsString + ' : ' + qrytmp.fieldbyname('PrintScripDesc').AsString);
      qrytmp.Next;
    end;
  end;
end;

procedure TForm2.mmoTypeInfoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='S') and (Shift = [ssShift]) then
  begin
    btnSave.Enabled := True;
  end;
end;

end.
