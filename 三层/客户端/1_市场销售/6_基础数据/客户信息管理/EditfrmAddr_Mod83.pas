unit EditfrmAddr_Mod83;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseEditFrm, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, DBCtrlsEh, Vcl.ComCtrls, RzEdit,
  RzBtnEdt, uRKeyBtnEdit, Data.DB, Datasnap.DBClient;

type
  TFrmEditAddr_Mod83 = class(TfrmBaseEdit)
    Label1: TLabel;
    Label39: TLabel;
    HeaderControl1: THeaderControl;
    TreeView1: TTreeView;
    Notebook1: TNotebook;
    Label2: TLabel;
    Bevel1: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label12: TLabel;
    Label9: TLabel;
    RkyLocation: TRKeyRzBtnEdit;
    RkyState: TRKeyRzBtnEdit;
    RkyZip: TRKeyRzBtnEdit;
    RkyConstractor: TRKeyRzBtnEdit;
    RkyPhone: TRKeyRzBtnEdit;
    RkyFax: TRKeyRzBtnEdit;
    RkyEmail: TRKeyRzBtnEdit;
    RkyShipMethod: TRKeyRzBtnEdit;
    RkyEarlyDays: TRKeyRzBtnEdit;
    RkyCountry: TRKeyRzBtnEdit;
    DbmmAdress: TDBMemo;
    RkyWeb: TRKeyRzBtnEdit;
    DBCheckBox1: TDBCheckBox;
    DbdtAwadDay: TDBDateTimeEditEh;
    rgrpttype: TDBRadioGroup;
    Label23: TLabel;
    Bevel2: TBevel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    EdtTax: TEdit;
    EdtTaxrate: TEdit;
    GroupBox1: TGroupBox;
    Label21: TLabel;
    Label22: TLabel;
    Label33: TLabel;
    Label32: TLabel;
    Label31: TLabel;
    Label42: TLabel;
    RkyTaxCode: TRKeyRzBtnEdit;
    RkyTaxMark: TRKeyRzBtnEdit;
    RkyBankCode: TRKeyRzBtnEdit;
    RkyBank: TRKeyRzBtnEdit;
    RkyLsrdjh: TRKeyRzBtnEdit;
    Label19: TLabel;
    Label20: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    GroupBox2: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    RkyShipRemark1: TRKeyRzBtnEdit;
    RkyShipRemark2: TRKeyRzBtnEdit;
    RkyShipRemark3: TRKeyRzBtnEdit;
    RkyReceivor: TRKeyRzBtnEdit;
    RkyReceivPhone: TRKeyRzBtnEdit;
    RkyReceivFax: TRKeyRzBtnEdit;
    RkyCompany: TRKeyRzBtnEdit;
    RkyShipAddress: TRKeyRzBtnEdit;
    RkyCompany2: TRKeyRzBtnEdit;
    RkyShipAddress2: TRKeyRzBtnEdit;
    cds12: TClientDataSet;
    ds12: TDataSource;
    RkyCustomerCode: TRKeyRzBtnEdit;
    RkyCustomerName: TRKeyRzBtnEdit;
    procedure btnCloseClick(Sender: TObject);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure RkyTaxCodeButtonClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure getdata(Rkey:string);
  procedure Init;
  end;

var
  FrmEditAddr_Mod83: TFrmEditAddr_Mod83;

implementation
uses
uCommFunc,uBaseSinglePickListFrm;
{$R *.dfm}

procedure TFrmEditAddr_Mod83.btnCloseClick(Sender: TObject);
begin
  inherited;
 Close;
end;

procedure TFrmEditAddr_Mod83.TreeView1Change(Sender: TObject; Node: TTreeNode);
begin
  inherited;
  notebook1.PageIndex:=node.SelectedIndex;
  headercontrol1.Sections[1].Text:=node.Text;
end;
procedure TFrmEditAddr_Mod83.btnSaveClick(Sender: TObject);
begin
  inherited;
  if Trim(RkyLocation.Text)='' then
  begin
    messagedlg('装运地点不允许为空！',mtconfirmation,[mbok],0);
    treeview1.Items[1].Selected:=true;
    notebook1.PageIndex:=1;
    RkyLocation.SetFocus;
    abort;
  end;
  if trim(RkyEarlyDays.Text)='' then
  begin
    messagedlg('装运提前天数不允许为空！',mtconfirmation,[mbok],0);
    treeview1.Items[1].Selected:=true;
    notebook1.PageIndex:=1;
    RkyEarlyDays.SetFocus;
    abort;
  end;
  if trim(RkyTaxCode.Text)='' then
  begin
    messagedlg('对应的增值税不允许为空！',mtconfirmation,[mbok],0);
    treeview1.Items[2].Selected:=true;
    notebook1.PageIndex:=2;
    RkyTaxCode.SetFocus;
    abort;
  end;
  ModalResult := mrOk;
end;

procedure TFrmEditAddr_Mod83.getdata(Rkey: string);
var
  lSQL:string;
begin
  lSQL := ' select * from data0012 where rkey='+Rkey;
  gSvrIntf.IntfGetDataBySql(lSQL,cds12);
end;

procedure TFrmEditAddr_Mod83.Init;
var
Lcds189:TClientDataSet;
Lsql189:string;
begin
  TreeView1.FullExpand;
  if cds12.FieldByName('ship_ctax_ptr').AsVariant=null then
  Exit
  else
  Lsql189:='select state_id,name,state_tax from data0189 where rkey='+cds12.FieldByName('ship_ctax_ptr').AsString;
  Lcds189:=TClientDataSet.Create(nil);
  try
   if not gSvrIntf.IntfGetDataBySql(Lsql189,Lcds189) then Exit;
   EdtTax.Text:=Lcds189.fieldbyname('state_id').AsString;
   EdtTaxrate.Text:=Lcds189.fieldbyname('state_tax').AsString;//填入增值税信息
  finally
   Lcds189.Free;
  end;
end;

procedure TFrmEditAddr_Mod83.RkyTaxCodeButtonClick(Sender: TObject);
var
  LFrm: TfrmSinglePickList;
begin
  //inherited;
  LFrm:=TfrmSinglePickList.Create(Self);
  try
    if Trim(RkyTaxCode.Text)<>'' then
    LFrm.InitWithPickID(83,StrToInt(RkyTaxCode.DisplayPickID),' where state_id LIKE ''%'+Trim(RkyTaxCode.Text)+'%''')
    else
    LFrm.InitWithPickID(83,StrToInt(RkyTaxCode.DisplayPickID),' order by state_id ');
    if LFrm.ShowModal= mrOk then
    begin
      EdtTax.Text:=LFrm.cdsPick.FieldByName('state_id').AsString;
      EdtTaxrate.Text:=LFrm.cdsPick.FieldByName('state_tax').AsString;
      cds12.Edit;
      cds12.FieldByName('SHIP_CTAX_PTR').Value:= LFrm.cdsPick.FieldByName('RKEY').Value;
      cds12.Post;
    end;
  finally
    LFrm.Free;
  end;
end;

end.
