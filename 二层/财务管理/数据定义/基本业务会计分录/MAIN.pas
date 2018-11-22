unit MAIN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, ExtCtrls, DB, Menus, ADODB;

type
  Tfrmmain = class(TForm)
    BitBtn1: TBitBtn;
    StringGrid1: TStringGrid;
    ADOQuery1: TADOQuery;
    ADOConnection1: TADOConnection;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    Panel1: TPanel;

    procedure FormCreate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frmmain: Tfrmmain;

implementation

uses edititem,AccSearch,common;
{$R *.dfm}

procedure Tfrmmain.FormCreate(Sender: TObject);

begin

  if not App_Init(ADOConnection1) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
  end;
  Caption := application.Title;
  
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

stringgrid1.Cells[0,0]:='序号';
stringgrid1.Cells[1,0]:='业务类别';
end;

procedure Tfrmmain.N1Click(Sender: TObject);
 begin
  try
  frmedititem:=tfrmedititem.Create(application);
  adoquery1.moveby(stringgrid1.Row-adoquery1.RecNo);
  case adoquery1.FieldByName('rkey').asinteger of
//  case stringgrid1.Row of
  1:begin
      FrmEditItem.Label6.Visible :=true;
      FrmEditItem.Label7.Visible :=true;
      FrmEditItem.Label8.Visible :=true;
      FrmEditItem.Label9.Visible :=true;
      FrmEditItem.Label10.Visible :=true;
      FrmEditItem.Label16.Visible :=true;
      FrmEditItem.Label17.Visible :=true;
      FrmEditItem.Label18.Visible :=true;
      FrmEditItem.Label19.Visible :=true;
      FrmEditItem.Label20.Visible :=true;
      FrmEditItem.Label26.Visible :=true;
      FrmEditItem.Label27.Visible :=true;
      FrmEditItem.Label28.Visible :=true;
      FrmEditItem.Label29.Visible :=true;
      FrmEditItem.Label30.Visible :=true;
      FrmEditItem.Edit1.Visible :=true;
      FrmEditItem.Edit2.Visible :=true;
      FrmEditItem.Edit3.Visible :=true;
      FrmEditItem.Edit4.Visible :=true;
      FrmEditItem.Edit5.Visible :=true;
      FrmEditItem.BitBtn3.Visible :=true;
      FrmEditItem.BitBtn4.Visible :=true;
      FrmEditItem.BitBtn5.Visible :=true;
      FrmEditItem.BitBtn6.Visible :=true;
      FrmEditItem.BitBtn7.Visible :=true;

      FrmEditItem.Label6.Caption :='材料';
      FrmEditItem.Label7.Caption :='税金';
      FrmEditItem.Label8.Caption :='运输费用';
      FrmEditItem.Label9.Caption :='杂项费用';
      FrmEditItem.Label10.Caption :='应付帐款(净价)';
      FrmEditItem.Label16.Caption :='借';
      FrmEditItem.Label17.Caption :='借';
      FrmEditItem.Label18.Caption :='借';
      FrmEditItem.Label19.Caption :='借';
      FrmEditItem.Label20.Caption :='贷';
      frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value :=adoquery1['dflt_acct_01'];
      frmedititem.ADOQuery1.Open;

      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit1.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label26.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;
      frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value:=adoquery1['dflt_acct_02'];
      frmedititem.ADOQuery1.Open;
      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit2.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label27.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;
      frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value:=adoquery1['dflt_acct_03'];
      frmedititem.ADOQuery1.Open;
      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit3.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label28.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;
        frmedititem.adoquery1.Close;
        frmedititem.ADOQuery1.Parameters[0].Value:=adoquery1['dflt_acct_04'];
        frmedititem.adoquery1.Open;

      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit4.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label29.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;

      frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value :=adoquery1['dflt_acct_05'];
      frmedititem.ADOQuery1.Open;
      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit5.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label30.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;
    end;
  2:begin
      FrmEditItem.Label6.Visible :=true;
      FrmEditItem.Label7.Visible :=true;
      FrmEditItem.Label8.Visible :=true;
      FrmEditItem.Label9.Visible :=true;
      FrmEditItem.Label10.Visible :=true;
      FrmEditItem.Label16.Visible :=true;
      FrmEditItem.Label17.Visible :=true;
      FrmEditItem.Label18.Visible :=true;
      FrmEditItem.Label19.Visible :=true;
      FrmEditItem.Label20.Visible :=true;
      FrmEditItem.Label26.Visible :=true;
      FrmEditItem.Label27.Visible :=true;
      FrmEditItem.Label28.Visible :=true;
      FrmEditItem.Label29.Visible :=true;
      FrmEditItem.Label30.Visible :=true;
      FrmEditItem.Edit1.Visible :=true;
      FrmEditItem.Edit2.Visible :=true;
      FrmEditItem.Edit3.Visible :=true;
      FrmEditItem.Edit4.Visible :=true;
      FrmEditItem.Edit5.Visible :=true;
      FrmEditItem.BitBtn3.Visible :=true;
      FrmEditItem.BitBtn4.Visible :=true;
      FrmEditItem.BitBtn5.Visible :=true;
      FrmEditItem.BitBtn6.Visible :=true;
      FrmEditItem.BitBtn7.Visible :=true;

      frmEditItem.Label6.Caption :='杂项物品';
      FrmEditItem.Label7.Caption :='税金';
      FrmEditItem.Label8.Caption :='运输费用';
      FrmEditItem.Label9.Caption :='杂项费用';
      FrmEditItem.Label10.Caption :='应付帐款(净价)';
      FrmEditItem.Label16.Caption :='借';
      FrmEditItem.Label17.Caption :='借';
      FrmEditItem.Label18.Caption :='借';
      FrmEditItem.Label19.Caption :='借';
      FrmEditItem.Label20.Caption :='贷';
      frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value:=adoquery1['dflt_acct_01'];
      frmedititem.adoquery1.open;
      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit1.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label26.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;
      frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value :=adoquery1['dflt_acct_02'];
      frmedititem.ADOQuery1.Open;
      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit2.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label27.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;
      frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value :=adoquery1['dflt_acct_03'];
      frmedititem.ADOQuery1.Open;
      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit3.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label28.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;
      frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value :=adoquery1['dflt_acct_04'];
      frmedititem.ADOQuery1.Open;
      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit4.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label29.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;
      frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value :=adoquery1['dflt_acct_05'];
      frmedititem.ADOQuery1.Open;
      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit5.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label30.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;
    end;
  3:begin
      FrmEditItem.Label6.Visible :=true;
      FrmEditItem.Label7.Visible :=true;
      FrmEditItem.Label8.Visible :=true;
      FrmEditItem.Label9.Visible :=true;
      FrmEditItem.Label10.Visible :=true;
      FrmEditItem.Label16.Visible :=true;
      FrmEditItem.Label17.Visible :=true;
      FrmEditItem.Label18.Visible :=true;
      FrmEditItem.Label19.Visible :=true;
      FrmEditItem.Label20.Visible :=true;
      FrmEditItem.Label26.Visible :=true;
      FrmEditItem.Label27.Visible :=true;
      FrmEditItem.Label28.Visible :=true;
      FrmEditItem.Label29.Visible :=true;
      FrmEditItem.Label30.Visible :=true;
      FrmEditItem.Edit1.Visible :=true;
      FrmEditItem.Edit2.Visible :=true;
      FrmEditItem.Edit3.Visible :=true;
      FrmEditItem.Edit4.Visible :=true;
      FrmEditItem.Edit5.Visible :=true;
      FrmEditItem.BitBtn3.Visible :=true;
      FrmEditItem.BitBtn4.Visible :=true;
      FrmEditItem.BitBtn5.Visible :=true;
      FrmEditItem.BitBtn6.Visible :=true;
      FrmEditItem.BitBtn7.Visible :=true;

      FrmEditItem.Label6.Caption :='应付帐款';
      FrmEditItem.Label7.Caption :='汇兑损失';
      FrmEditItem.Label8.Caption :='现金/银行存款';
      FrmEditItem.Label9.Caption :='汇兑收益';
      FrmEditItem.Label10.Caption :='现金折扣';
      FrmEditItem.Label16.Caption :='借';
      FrmEditItem.Label17.Caption :='借';
      FrmEditItem.Label18.Caption :='贷';
      FrmEditItem.Label19.Caption :='贷';
      FrmEditItem.Label20.Caption :='贷';
        frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value:=adoquery1['dflt_acct_01'];
      frmedititem.adoquery1.open;
      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit1.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label26.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;
      frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value :=adoquery1['dflt_acct_02'];
      frmedititem.ADOQuery1.Open;
      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit2.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label27.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;
      frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value :=adoquery1['dflt_acct_03'];
      frmedititem.ADOQuery1.Open;
      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit3.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label28.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;
      frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value :=adoquery1['dflt_acct_04'];
      frmedititem.ADOQuery1.Open;
      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit4.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label29.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;
       frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value :=adoquery1['dflt_acct_05'];
      frmedititem.ADOQuery1.Open;
      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit5.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label30.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;
    end;
  4:begin
      FrmEditItem.Label6.Visible :=true;
      FrmEditItem.Label7.Visible :=true;
      FrmEditItem.Label8.Visible :=true;
      FrmEditItem.Label9.Visible :=true;
      FrmEditItem.Label10.Visible :=true;
      FrmEditItem.Label11.Visible :=true;
      FrmEditItem.Label16.Visible :=true;
      FrmEditItem.Label17.Visible :=true;
      FrmEditItem.Label18.Visible :=true;
      FrmEditItem.Label19.Visible :=true;
      FrmEditItem.Label20.Visible :=true;
      FrmEditItem.Label21.Visible :=true;
      FrmEditItem.Label26.Visible :=true;
      FrmEditItem.Label27.Visible :=true;
      FrmEditItem.Label28.Visible :=true;
      FrmEditItem.Label29.Visible :=true;
      FrmEditItem.Label30.Visible :=true;
      FrmEditItem.Label31.Visible :=true;
      FrmEditItem.Edit1.Visible :=true;
      FrmEditItem.Edit2.Visible :=true;
      FrmEditItem.Edit3.Visible :=true;
      FrmEditItem.Edit4.Visible :=true;
      FrmEditItem.Edit5.Visible :=true;
      FrmEditItem.Edit6.Visible :=true;
      FrmEditItem.BitBtn3.Visible :=true;
      FrmEditItem.BitBtn4.Visible :=true;
      FrmEditItem.BitBtn5.Visible :=true;
      FrmEditItem.BitBtn6.Visible :=true;
      FrmEditItem.BitBtn7.Visible :=true;
      FrmEditItem.BitBtn8.Visible :=true;

      FrmEditItem.Label6.Caption :='应付帐款(净价)';
      FrmEditItem.Label7.Caption :='退货';
      FrmEditItem.Label8.Caption :='税金';
      FrmEditItem.Label9.Caption :='运输费用';
      FrmEditItem.Label10.Caption :='杂项费用';
      FrmEditItem.Label11.Caption :='其他';
      FrmEditItem.Label16.Caption :='借';
      FrmEditItem.Label17.Caption :='贷';
      FrmEditItem.Label18.Caption :='贷';
      FrmEditItem.Label19.Caption :='贷';
      FrmEditItem.Label20.Caption :='贷';
      FrmEditItem.Label21.Caption :='贷';
        frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value:=adoquery1['dflt_acct_01'];
      frmedititem.adoquery1.open;
      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit1.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label26.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;
      frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value :=adoquery1['dflt_acct_02'];
      frmedititem.ADOQuery1.Open;
      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit2.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label27.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;
      frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value :=adoquery1['dflt_acct_03'];
      frmedititem.ADOQuery1.Open;
      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit3.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label28.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;
      frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value :=adoquery1['dflt_acct_04'];
      frmedititem.ADOQuery1.Open;
      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit4.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label29.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;
       frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value :=adoquery1['dflt_acct_05'];
      frmedititem.ADOQuery1.Open;
      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit5.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label30.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;
      frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value :=adoquery1['dflt_acct_06'];
      frmedititem.ADOQuery1.Open;
      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit6.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label31.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;
    end;
  5:begin
      FrmEditItem.Label6.Visible :=true;
      FrmEditItem.Label7.Visible :=true;
      FrmEditItem.Label8.Visible :=true;
      FrmEditItem.Label9.Visible :=true;
      FrmEditItem.Label10.Visible :=true;
      FrmEditItem.Label11.Visible :=true;
      FrmEditItem.Label16.Visible :=true;
      FrmEditItem.Label17.Visible :=true;
      FrmEditItem.Label18.Visible :=true;
      FrmEditItem.Label19.Visible :=true;
      FrmEditItem.Label20.Visible :=true;
      FrmEditItem.Label21.Visible :=true;
      FrmEditItem.Label26.Visible :=true;
      FrmEditItem.Label27.Visible :=true;
      FrmEditItem.Label28.Visible :=true;
      FrmEditItem.Label29.Visible :=true;
      FrmEditItem.Label30.Visible :=true;
      FrmEditItem.Label31.Visible :=true;
      FrmEditItem.Edit1.Visible :=true;
      FrmEditItem.Edit2.Visible :=true;
      FrmEditItem.Edit3.Visible :=true;
      FrmEditItem.Edit4.Visible :=true;
      FrmEditItem.Edit5.Visible :=true;
      FrmEditItem.Edit6.Visible :=true;
      FrmEditItem.BitBtn3.Visible :=true;
      FrmEditItem.BitBtn4.Visible :=true;
      FrmEditItem.BitBtn5.Visible :=true;
      FrmEditItem.BitBtn6.Visible :=true;
      FrmEditItem.BitBtn7.Visible :=true;
      FrmEditItem.BitBtn8.Visible :=true;

      FrmEditItem.Label6.Caption :='应收帐款(净价)';
      FrmEditItem.Label7.Caption :='产品销售收入';
      FrmEditItem.Label8.Caption :='Tooling费用收入';
      FrmEditItem.Label9.Caption :='运输费用收入';
      FrmEditItem.Label10.Caption :='赶工费用收入';
      FrmEditItem.Label11.Caption :='税金';
      FrmEditItem.Label16.Caption :='借';
      FrmEditItem.Label17.Caption :='贷';
      FrmEditItem.Label18.Caption :='贷';
      FrmEditItem.Label19.Caption :='贷';
      FrmEditItem.Label20.Caption :='贷';
      FrmEditItem.Label21.Caption :='贷';
           frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value:=adoquery1['dflt_acct_01'];
      frmedititem.adoquery1.open;
      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit1.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label26.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;
      frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value :=adoquery1['dflt_acct_02'];
      frmedititem.ADOQuery1.Open;
      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit2.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label27.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;
      frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value :=adoquery1['dflt_acct_03'];
      frmedititem.ADOQuery1.Open;
      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit3.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label28.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;
      frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value :=adoquery1['dflt_acct_04'];
      frmedititem.ADOQuery1.Open;
      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit4.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label29.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;
      frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value :=adoquery1['dflt_acct_05'];
      frmedititem.ADOQuery1.Open;
      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit5.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label30.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;
      frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value :=adoquery1['dflt_acct_06'];
      frmedititem.ADOQuery1.Open;
      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit6.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label31.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;
    end;
  6:begin
      FrmEditItem.Label6.Visible :=true;
      FrmEditItem.Label7.Visible :=true;
      FrmEditItem.Label8.Visible :=true;
      FrmEditItem.Label9.Visible :=true;
      FrmEditItem.Label10.Visible :=true;
      FrmEditItem.Label11.Visible :=true;
      FrmEditItem.Label12.Visible :=true;
      FrmEditItem.Label16.Visible :=true;
      FrmEditItem.Label17.Visible :=true;
      FrmEditItem.Label18.Visible :=true;
      FrmEditItem.Label19.Visible :=true;
      FrmEditItem.Label20.Visible :=true;
      FrmEditItem.Label21.Visible :=true;
      FrmEditItem.Label22.Visible :=true;
      FrmEditItem.Label26.Visible :=true;
      FrmEditItem.Label27.Visible :=true;
      FrmEditItem.Label28.Visible :=true;
      FrmEditItem.Label29.Visible :=true;
      FrmEditItem.Label30.Visible :=true;
      FrmEditItem.Label31.Visible :=true;
      FrmEditItem.Label32.Visible :=true;
      FrmEditItem.Edit1.Visible :=true;
      FrmEditItem.Edit2.Visible :=true;
      FrmEditItem.Edit3.Visible :=true;
      FrmEditItem.Edit4.Visible :=true;
      FrmEditItem.Edit5.Visible :=true;
      FrmEditItem.Edit6.Visible :=true;
      FrmEditItem.Edit7.Visible :=true;
      FrmEditItem.BitBtn3.Visible :=true;
      FrmEditItem.BitBtn4.Visible :=true;
      FrmEditItem.BitBtn5.Visible :=true;
      FrmEditItem.BitBtn6.Visible :=true;
      FrmEditItem.BitBtn7.Visible :=true;
      FrmEditItem.BitBtn8.Visible :=true;
      FrmEditItem.BitBtn9.Visible :=true;

      FrmEditItem.Label6.Caption :='现金/银行存款';
      FrmEditItem.Label7.Caption :='现金折扣';
      FrmEditItem.Label8.Caption :='汇兑损失';
      FrmEditItem.Label9.Caption :='退货/价格折让';
      FrmEditItem.Label10.Caption :='应收帐款';
      FrmEditItem.Label11.Caption :='汇兑收益';
      FrmEditItem.Label12.Caption :='杂项费用';
      FrmEditItem.Label16.Caption :='借';
      FrmEditItem.Label17.Caption :='借';
      FrmEditItem.Label18.Caption :='借';
      FrmEditItem.Label19.Caption :='借';
      FrmEditItem.Label20.Caption :='贷';
      FrmEditItem.Label21.Caption :='贷';
      FrmEditItem.Label22.Caption :='贷';
      frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value:=adoquery1['dflt_acct_01'];
      frmedititem.adoquery1.open;
      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit1.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label26.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;
      frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value :=adoquery1['dflt_acct_02'];
      frmedititem.ADOQuery1.Open;
      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit2.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label27.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;
      frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value :=adoquery1['dflt_acct_03'];
      frmedititem.ADOQuery1.Open;
      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit3.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label28.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;
      frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value :=adoquery1['dflt_acct_04'];
      frmedititem.ADOQuery1.Open;
      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit4.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label29.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;
      frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value :=adoquery1['dflt_acct_05'];
      frmedititem.ADOQuery1.Open;
      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit5.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label30.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;
      frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value :=adoquery1['dflt_acct_06'];
      frmedititem.ADOQuery1.Open;
      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit6.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label31.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;
       frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value :=adoquery1['dflt_acct_07'];
      frmedititem.ADOQuery1.Open;
      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit7.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label32.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;
    end;
  7:begin
      FrmEditItem.Label6.Visible :=true;
      FrmEditItem.Label7.Visible :=true;
      FrmEditItem.Label8.Visible :=true;
      FrmEditItem.Label9.Visible :=true;
      FrmEditItem.Label10.Visible :=true;
      FrmEditItem.Label11.Visible :=true;
      FrmEditItem.Label16.Visible :=true;
      FrmEditItem.Label17.Visible :=true;
      FrmEditItem.Label18.Visible :=true;
      FrmEditItem.Label19.Visible :=true;
      FrmEditItem.Label20.Visible :=true;
      FrmEditItem.Label21.Visible :=true;
      FrmEditItem.Label26.Visible :=true;
      FrmEditItem.Label27.Visible :=true;
      FrmEditItem.Label28.Visible :=true;
      FrmEditItem.Label29.Visible :=true;
      FrmEditItem.Label30.Visible :=true;
      FrmEditItem.Label31.Visible :=true;
      FrmEditItem.Edit1.Visible :=true;
      FrmEditItem.Edit2.Visible :=true;
      FrmEditItem.Edit3.Visible :=true;
      FrmEditItem.Edit4.Visible :=true;
      FrmEditItem.Edit5.Visible :=true;
      FrmEditItem.Edit6.Visible :=true;
      FrmEditItem.BitBtn3.Visible :=true;
      FrmEditItem.BitBtn4.Visible :=true;
      FrmEditItem.BitBtn5.Visible :=true;
      FrmEditItem.BitBtn6.Visible :=true;
      FrmEditItem.BitBtn7.Visible :=true;
      FrmEditItem.BitBtn8.Visible :=true;

      FrmEditItem.Label6.Caption :='产品销售收入';
      FrmEditItem.Label7.Caption :='Tooling费用收入';
      FrmEditItem.Label8.Caption :='运输费用收入';
      FrmEditItem.Label9.Caption :='赶工费用收入';
      FrmEditItem.Label10.Caption :='税金';
      FrmEditItem.Label11.Caption :='应收帐款';
      FrmEditItem.Label16.Caption :='借';
      FrmEditItem.Label17.Caption :='借';
      FrmEditItem.Label18.Caption :='借';
      FrmEditItem.Label19.Caption :='借';
      FrmEditItem.Label20.Caption :='借';
      FrmEditItem.Label21.Caption :='贷';
      frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value:=adoquery1['dflt_acct_01'];
      frmedititem.adoquery1.open;
      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit1.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label26.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;
      frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value :=adoquery1['dflt_acct_02'];
      frmedititem.ADOQuery1.Open;
      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit2.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label27.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;
      frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value :=adoquery1['dflt_acct_03'];
      frmedititem.ADOQuery1.Open;
      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit3.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label28.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;
      frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value :=adoquery1['dflt_acct_04'];
      frmedititem.ADOQuery1.Open;
      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit4.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label29.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;
      frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value :=adoquery1['dflt_acct_05'];
      frmedititem.ADOQuery1.Open;
      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit5.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label30.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;
      frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value :=adoquery1['dflt_acct_06'];
      frmedititem.ADOQuery1.Open;
      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit6.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label31.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;
    end;
  8:begin
      FrmEditItem.Label6.Visible :=true;
      FrmEditItem.Label7.Visible :=true;

      FrmEditItem.Label16.Visible :=true;
      FrmEditItem.Label17.Visible :=true;


      FrmEditItem.Label26.Visible :=true;
      FrmEditItem.Label27.Visible :=true;

      FrmEditItem.Edit1.Visible :=true;
      FrmEditItem.Edit2.Visible :=true;

      FrmEditItem.BitBtn3.Visible :=true;
      FrmEditItem.BitBtn4.Visible :=true;

      FrmEditItem.Label6.Caption :='生产成本';
      FrmEditItem.Label7.Caption :='原材料';
      FrmEditItem.Label16.Caption :='借';
      FrmEditItem.Label17.Caption :='贷';
       frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value:=adoquery1['dflt_acct_01'];
      frmedititem.adoquery1.open;
      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit1.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label26.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;
      frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value :=adoquery1['dflt_acct_02'];
      frmedititem.ADOQuery1.Open;
      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit2.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label27.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;
    end;
  9:begin
    FrmEditItem.Label6.Visible :=true;
      FrmEditItem.Label7.Visible :=true;

      FrmEditItem.Label16.Visible :=true;
      FrmEditItem.Label17.Visible :=true;


      FrmEditItem.Label26.Visible :=true;
      FrmEditItem.Label27.Visible :=true;

      FrmEditItem.Edit1.Visible :=true;
      FrmEditItem.Edit2.Visible :=true;

      FrmEditItem.BitBtn3.Visible :=true;
      FrmEditItem.BitBtn4.Visible :=true;


      FrmEditItem.Label6.Caption :='在制品';
      FrmEditItem.Label7.Caption :='生产成本';
      FrmEditItem.Label16.Caption :='借';
      FrmEditItem.Label17.Caption :='贷';
        frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value:=adoquery1['dflt_acct_01'];
      frmedititem.adoquery1.open;
      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit1.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label26.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;
      frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value :=adoquery1['dflt_acct_02'];
      frmedititem.ADOQuery1.Open;
      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit2.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label27.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;
    end;
  10:begin
      FrmEditItem.Label6.Visible :=true;
      FrmEditItem.Label7.Visible :=true;


      FrmEditItem.Label16.Visible :=true;
      FrmEditItem.Label17.Visible :=true;



      FrmEditItem.Label26.Visible :=true;
      FrmEditItem.Label27.Visible :=true;

      FrmEditItem.Edit1.Visible :=true;
      FrmEditItem.Edit2.Visible :=true;


      FrmEditItem.BitBtn3.Visible :=true;
      FrmEditItem.BitBtn4.Visible :=true;


      FrmEditItem.Label6.Caption :='汇兑损失';
      FrmEditItem.Label7.Caption :='汇兑收益';

      FrmEditItem.Label16.Caption :='借';
      FrmEditItem.Label17.Caption :='贷';

      frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value:=adoquery1['dflt_acct_01'];
      frmedititem.adoquery1.open;
      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit1.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label26.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;

      frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value :=adoquery1['dflt_acct_02'];
      frmedititem.ADOQuery1.Open;
      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit2.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label27.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;
     end;

   11:begin
     FrmEditItem.Label6.Visible :=true;
      FrmEditItem.Label7.Visible :=true;
      FrmEditItem.Label8.Visible :=true;
      FrmEditItem.Label9.Visible :=true;

      FrmEditItem.Label16.Visible :=true;
      FrmEditItem.Label17.Visible :=true;
      FrmEditItem.Label18.Visible :=true;
      FrmEditItem.Label19.Visible :=true;

      FrmEditItem.Label26.Visible :=true;
      FrmEditItem.Label27.Visible :=true;
      FrmEditItem.Label28.Visible :=true;
      FrmEditItem.Label29.Visible :=true;

      FrmEditItem.Edit1.Visible :=true;
      FrmEditItem.Edit2.Visible :=true;
      FrmEditItem.Edit3.Visible :=true;
      FrmEditItem.Edit4.Visible :=true;

      FrmEditItem.BitBtn3.Visible :=true;
      FrmEditItem.BitBtn4.Visible :=true;
      FrmEditItem.BitBtn5.Visible :=true;
      FrmEditItem.BitBtn6.Visible :=true;


      FrmEditItem.Label6.Caption :='销售成本-产成品';
      FrmEditItem.Label7.Caption :='产成品(期末)';
      FrmEditItem.Label8.Caption :='产成品(起初)';
      FrmEditItem.Label9.Caption :='产成品(本期完工)';

      FrmEditItem.Label16.Caption :='借';
      FrmEditItem.Label17.Caption :='借';
      FrmEditItem.Label18.Caption :='贷';
      FrmEditItem.Label19.Caption :='贷';
      frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value:=adoquery1['dflt_acct_01'];
      frmedititem.adoquery1.open;
      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit1.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label26.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;
      frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value :=adoquery1['dflt_acct_02'];
      frmedititem.ADOQuery1.Open;
      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit2.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label27.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;
      frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value :=adoquery1['dflt_acct_03'];
      frmedititem.ADOQuery1.Open;
      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit3.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label28.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;
      frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value :=adoquery1['dflt_acct_04'];
      frmedititem.ADOQuery1.Open;
      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit4.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label29.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;
  end;


12:begin
      FrmEditItem.Label6.Visible :=true;
      FrmEditItem.Label7.Visible :=true;
      FrmEditItem.Label16.Visible :=true;
      FrmEditItem.Label17.Visible :=true;
      FrmEditItem.Label26.Visible :=true;
      FrmEditItem.Label27.Visible :=true;

      FrmEditItem.Edit1.Visible :=true;
      FrmEditItem.Edit2.Visible :=true;

      FrmEditItem.BitBtn3.Visible :=true;
      FrmEditItem.BitBtn4.Visible :=true;

      FrmEditItem.Label6.Caption :='应交税金';
      FrmEditItem.Label16.Caption :='借';
      FrmEditItem.Label7.Caption :='暂估进项';
      FrmEditItem.Label17.Caption :='贷';
      frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value:=adoquery1['dflt_acct_01'];
      frmedititem.adoquery1.open;
      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit1.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label26.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;
      frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value :=adoquery1['dflt_acct_02'];
      frmedititem.ADOQuery1.Open;
      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit2.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label27.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;
      
   end;

  13:begin
      FrmEditItem.Label6.Visible :=true;
      FrmEditItem.Label7.Visible :=true;
      FrmEditItem.Label8.Visible :=true;
      FrmEditItem.Label16.Visible :=true;
      FrmEditItem.Label17.Visible :=true;
      FrmEditItem.Label18.Visible :=true;

      FrmEditItem.Label26.Visible :=true;
      FrmEditItem.Label27.Visible :=true;
      FrmEditItem.Label28.Visible :=true;

      FrmEditItem.Edit1.Visible :=true;
      FrmEditItem.Edit2.Visible :=true;
      FrmEditItem.Edit3.Visible :=true;

      FrmEditItem.BitBtn3.Visible :=true;
      FrmEditItem.BitBtn4.Visible :=true;
      FrmEditItem.BitBtn5.Visible :=true;

      FrmEditItem.Label6.Caption :='固定资产';
      FrmEditItem.Label16.Caption :='借/贷';
      FrmEditItem.Label7.Caption :='累计折旧';
      FrmEditItem.Label17.Caption :='借/贷';
      FrmEditItem.Label8.Caption :='固定资产清理';
      FrmEditItem.Label18.Caption :='借/贷';
      frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value:=adoquery1['dflt_acct_01'];
      frmedititem.adoquery1.open;
      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit1.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label26.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;
      frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value :=adoquery1['dflt_acct_02'];
      frmedititem.ADOQuery1.Open;
      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit2.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label27.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;
      frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value:=adoquery1['dflt_acct_03'];
      frmedititem.adoquery1.open;
      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit3.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label28.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;
   end;
  14:begin
      FrmEditItem.Label6.Visible :=true;
      FrmEditItem.Label16.Visible :=true;
      FrmEditItem.Label26.Visible :=true;
      FrmEditItem.BitBtn3.Visible :=true;
      FrmEditItem.Edit1.Visible :=true;
      FrmEditItem.Label16.Caption :='借/贷';
      FrmEditItem.Label6.Caption :='固定资产';

      frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value:=adoquery1['dflt_acct_01'];
      frmedititem.adoquery1.open;
      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit1.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label26.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;
     end;
  15:begin
      FrmEditItem.Label6.Visible :=true;
      FrmEditItem.Label16.Visible :=true;
      FrmEditItem.Label26.Visible :=true;
      FrmEditItem.Edit1.Visible :=true;
      FrmEditItem.BitBtn3.Visible :=true;
      FrmEditItem.Label6.Caption :='本年利润';
      FrmEditItem.Label16.Caption :='借/贷';
      frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value:=adoquery1['dflt_acct_01'];
      frmedititem.adoquery1.open;
      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit1.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label26.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;
    end;
  16:begin
      FrmEditItem.Label6.Visible :=true;
      FrmEditItem.Label16.Visible :=true;
      FrmEditItem.Label26.Visible :=true;
      FrmEditItem.Edit1.Visible :=true;
      FrmEditItem.BitBtn3.Visible :=true;

      FrmEditItem.Label6.Caption :='发出商品(内销)';
      FrmEditItem.Label16.Caption :='借';

      FrmEditItem.Label7.Visible :=true;
      FrmEditItem.Label17.Visible :=true;
      FrmEditItem.Label27.Visible :=true;
      FrmEditItem.Edit2.Visible :=true;
      FrmEditItem.BitBtn4.Visible :=true;

      FrmEditItem.Label7.Caption :='库存商品(内销)';
      FrmEditItem.Label17.Caption :='贷';

      FrmEditItem.Label8.Visible :=true;
      FrmEditItem.Label18.Visible :=true;
      FrmEditItem.Label28.Visible :=true;
      FrmEditItem.Edit3.Visible :=true;
      FrmEditItem.BitBtn5.Visible :=true;

      FrmEditItem.Label8.Caption :='发出商品(转厂)';
      FrmEditItem.Label18.Caption :='借';

      FrmEditItem.Label9.Visible :=true;
      FrmEditItem.Label19.Visible :=true;
      FrmEditItem.Label29.Visible :=true;
      FrmEditItem.Edit4.Visible :=true;
      FrmEditItem.BitBtn6.Visible :=true;

      FrmEditItem.Label9.Caption :='库存商品(转厂)';
      FrmEditItem.Label19.Caption :='贷';

      frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value:=adoquery1['dflt_acct_01'];
      frmedititem.adoquery1.open;
      if frmedititem.ADOQuery1.RecordCount>0 then
       begin
        FrmEditItem.edit1.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label26.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
       end;

      frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value :=adoquery1['dflt_acct_02'];
      frmedititem.ADOQuery1.Open;
      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit2.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label27.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;

      frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value:=adoquery1['dflt_acct_03'];
      frmedititem.adoquery1.open;
      if frmedititem.ADOQuery1.RecordCount>0 then
       begin
        FrmEditItem.edit3.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label28.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
       end;

      frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value :=adoquery1['dflt_acct_04'];
      frmedititem.ADOQuery1.Open;
      if frmedititem.ADOQuery1.RecordCount>0 then
      begin
        FrmEditItem.edit4.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label29.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
      end;

    end;
  17:begin
      FrmEditItem.Label6.Visible :=true;
      FrmEditItem.Label16.Visible :=true;
      FrmEditItem.Label26.Visible :=true;
      FrmEditItem.BitBtn3.Visible :=true;
      FrmEditItem.Edit1.Visible :=true;
      FrmEditItem.Label16.Caption :='借/贷';
      FrmEditItem.Label6.Caption :='固定资产';

      FrmEditItem.Label7.Visible :=true;
      FrmEditItem.Label17.Visible :=true;
      FrmEditItem.Label27.Visible :=true;
      FrmEditItem.BitBtn4.Visible :=true;
      FrmEditItem.Edit2.Visible :=true;
      FrmEditItem.Label17.Caption :='借/贷';
      FrmEditItem.Label7.Caption :='累计折旧';

      frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value:=adoquery1['dflt_acct_01'];
      frmedititem.adoquery1.open;
      if frmedititem.ADOQuery1.RecordCount>0 then
       begin
        FrmEditItem.edit1.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label26.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
       end;

      frmedititem.ADOQuery1.Close;
      frmedititem.ADOQuery1.Parameters[0].Value:=adoquery1['dflt_acct_02'];
      frmedititem.adoquery1.open;
      if frmedititem.ADOQuery1.RecordCount>0 then
       begin
        FrmEditItem.edit2.Text :=FrmEditItem.ADOQuery1.FieldValues['gl_acc_number'];
        FrmEditItem.label27.Caption :=FrmEditItem.ADOQuery1.FieldValues['gl_description'];
       end;

     end;
  end;
  FrmEditItem.Caption :=FrmEditItem.Caption+'-'+self.ADOQuery1.fieldbyname('journal_title').asstring;
  if (sender = frmmain.N2) then FrmEditItem.BitBtn1.Enabled:=false ;
  if FrmEditItem.showmodal=mrok then
  begin
   if adoquery1.State=dsedit then
    adoquery1.Post
   else
    adoquery1.Cancel;
  end;
  finally
   FrmEditItem.free;
  end;
end;


procedure Tfrmmain.FormShow(Sender: TObject);
var i:integer;
begin
if trim(vprev)='' then  application.Terminate;
 if (trim(vprev)='1') or
     (trim(vprev)='3') then
 n1.Enabled :=false;
// Adoconnection1.ConnectionString :=db_ptr.Caption ;
// Adoconnection1.Connected :=true;


adoquery1.open;
adoquery1.First;
i:=1;
 while not adoquery1.Eof do
 begin
 stringgrid1.RowCount:=i+1;
 stringgrid1.cells[0,i]:=inttostr(stringgrid1.RowCount-1);
 stringgrid1.Cells[1,i]:=adoquery1.fieldbyname('journal_title').AsString;
 adoquery1.Next;
 i:=i+1;
 end;
end;

procedure Tfrmmain.StringGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;//右键选择stringgrid控件的方法
begin
if button=mbright then
 begin
  stringgrid1.MouseToCell(x,y,column,row);
  if row<>0 then
   begin
    stringgrid1.Row:=row;
    stringgrid1.col:=column;
   end;
 end;

end;

procedure Tfrmmain.N2Click(Sender: TObject);
begin
 frmmain.N1Click(sender);
end;

end.
