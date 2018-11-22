unit BOMBaoJiaTypeEditCaiLiao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, RzButton, GridsEh, DBAxisGridsEh, DBGridEh,
  Vcl.StdCtrls, RzCmboBx, Vcl.Buttons, RzLabel, Vcl.ExtCtrls, RzPanel, Data.DB,
  Datasnap.DBClient, DM, Vcl.Menus;

type
  TfrmBomBaoJiaTypeEditCaiLiao = class(TForm)
    pnl11: TRzPanel;
    lbl17: TRzLabel;
    lbl38: TRzLabel;
    btn4: TSpeedButton;
    cbx1: TRzComboBox;
    eh3: TDBGridEh;
    pnl1: TRzPanel;
    btn2: TRzButton;
    btn1: TRzButton;
    dsBP15: TDataSource;
    cdsBP15: TClientDataSet;
    strngfldBP15idkey: TStringField;
    strngfldBP15BP00_ptr: TStringField;
    strngfldBP15BP01_ptr: TStringField;
    intgrfldBP15d34_ptr: TIntegerField;
    intgrfldBP15d17_ptr: TIntegerField;
    strngfldBP15MGroupname: TStringField;
    strngfldBP15MGroupDesc: TStringField;
    strngfldBP15MName: TStringField;
    intgrfldBP15beishu: TIntegerField;
    intgrfldBP15d496_ptr: TIntegerField;
    pm1: TPopupMenu;
    mnidelete: TMenuItem;
    intgrfldBP15d28_ptr: TIntegerField;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure cdsBP15CalcFields(DataSet: TDataSet);
    procedure pm1Popup(Sender: TObject);
    procedure mnideleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FBP00_ptr: string;
    FBP01_ptr: string;
    FD34_Ptr: string;
  end;


implementation
uses
  DBImpl,DataIntf, Pick_Item_Single;

{$R *.dfm}

procedure TfrmBomBaoJiaTypeEditCaiLiao.btn1Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmBomBaoJiaTypeEditCaiLiao.btn2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmBomBaoJiaTypeEditCaiLiao.btn4Click(Sender: TObject);
var
  LFrm: TfrmPick_Item_Single;
  LIn: PDlgInput;
  lcds: TClientDataSet;
  Itmp: IData;
begin
  if cbx1.ItemIndex = -1 then Exit;

  LIn.Fields := 'INV_PART_NUMBER/材料编码/150,INV_NAME/材料名称/100,INV_DESCRIPTION/规格型号/300,ABBR_NAME/供应商简称/100,SUPPLIER_NAME/供应商全称/150,PRICE_1/价格/100,TDATE/价格日期/120';
  LIn.Sqlstr := ' SELECT d17.rkey,d28.rkey as rkey28,d17.INV_PART_NUMBER,d17.INV_NAME,d17.INV_DESCRIPTION,d23.ABBR_NAME,d23.SUPPLIER_NAME,d28.PRICE_1,d28.TDATE FROM data0017 d17 ' +
                ' INNER JOIN data0028 d28 on d17.RKEY = d28.INVENTORY_PTR ' +
                ' INNER JOIN data0023 d23 ON d28.SUPPLIER_PTR = d23.RKEY ' +
                ' where d17.group_ptr = ' + IntToStr(Integer(cbx1.Items.Objects[cbx1.ItemIndex])) +
                ' order by d23.ABBR_NAME desc,d28.tdate desc';
  LIn.AdoConn := dm1.con1;
  LFrm := TfrmPick_Item_Single.Create(Self);
  lcds := TClientDataSet.Create(Self);
  try
    LFrm.InitForm_New(LIn);
    if LFrm.ShowModal = mrOk then
    begin
      Itmp := TTmp.Create;
      Itmp.SetSql('select * from bomprice04 where d34_ptr = ' + FD34_Ptr);
      lcds.Data := Itmp.GetData;

      cdsBP15.Append;
      cdsBP15.FieldByName('idkey').AsString := ITmp.CreateKeyID;
      cdsBP15.FieldByName('BP00_ptr').AsString := FBP00_ptr;
      cdsBP15.FieldByName('BP01_ptr').AsString := FBP01_ptr;
      cdsBP15.FieldByName('d496_ptr').AsInteger := Integer(cbx1.Items.Objects[cbx1.ItemIndex]);
      cdsBP15.FieldByName('d34_ptr').AsString := FD34_Ptr;
      cdsBP15.FieldByName('d17_ptr').AsInteger := LFrm.adsPick1.FieldByName('rkey').AsInteger;
      cdsBP15.FieldByName('d28_ptr').AsInteger := LFrm.adsPick1.FieldByName('rkey28').AsInteger;
      cdsBP15.FieldByName('beishu').AsInteger := 1;
      cdsBP15.Post;
    end;
  finally
    LFrm.Free;
    lcds.Free;
  end;
end;

procedure TfrmBomBaoJiaTypeEditCaiLiao.cdsBP15CalcFields(DataSet: TDataSet);
var
  LTmp: ITmp;
  LCds: TClientDataSet;
begin
  LTmp := TTmp.Create;
  LCds := TClientDataSet.Create(Self);
  try
    LCds.Data := LTmp.SqlOpen('select INV_PART_DESCRIPTION from data0017 where rkey = ' + IntToStr(cdsBP15.FieldByName('d17_ptr').AsInteger));
    cdsBP15.FieldByName('MName').AsString := LCds.FieldByName('INV_PART_DESCRIPTION').AsString;
  finally
    LCds.Free;
  end;
end;

procedure TfrmBomBaoJiaTypeEditCaiLiao.mnideleteClick(Sender: TObject);
begin
  cdsBP15.Delete;
end;

procedure TfrmBomBaoJiaTypeEditCaiLiao.pm1Popup(Sender: TObject);
begin
  mnidelete.Enabled := not cdsBP15.IsEmpty;
end;

end.
