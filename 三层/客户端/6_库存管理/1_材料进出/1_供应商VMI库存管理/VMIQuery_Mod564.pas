unit VMIQuery_Mod564;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseEditFrm,ucommfunc, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Grids, Vcl.Menus,uBaseSinglePickListFrm,VMIrukuMX;

type
  TfrmVMIQuery_Mod564 = class(TfrmBaseEdit)
    RadioGroup1: TRadioGroup;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    DTTm1: TDateTimePicker;
    DTPk2: TDateTimePicker;
    DTPk1: TDateTimePicker;
    Button1: TButton;
    BitBtn4: TBitBtn;
    ListBox1: TListBox;
    StaticText1: TStaticText;
    Edit1: TEdit;
    DTTm2: TDateTimePicker;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    dttm3: TDateTimePicker;
    ListBox2: TListBox;
    StaticText3: TStaticText;
    DtPk4: TDateTimePicker;
    DtPk3: TDateTimePicker;
    Button2: TButton;
    BitBtn5: TBitBtn;
    Edit2: TEdit;
    dttm4: TDateTimePicker;
    GroupBox3: TGroupBox;
    Label21: TLabel;
    Button7: TButton;
    BitBtn11: TBitBtn;
    ListBox3: TListBox;
    StaticText8: TStaticText;
    Edit7: TEdit;
    StaticText2: TStaticText;
    SGrid1: TStringGrid;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    RGp4: TRadioGroup;
    procedure RadioGroup1Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
    v_Field_List_CN,v_Field_List_EN:Variant;
  public
    { Public declarations }
    FDisplayFrm1: TfrmVMIrukuMX;
  end;

var
  frmVMIQuery_Mod564: TfrmVMIQuery_Mod564;

implementation

{$R *.dfm}

procedure TfrmVMIQuery_Mod564.BitBtn11Click(Sender: TObject);
var LFrm: TfrmSinglePickList;
begin
  inherited;
  LFrm := TfrmSinglePickList.Create(Self);
  try
    case listbox3.ItemIndex of
      0:
      begin
        LFrm.InitWithPickID(564,3);
        if LFrm.ShowModal = mrOk then
        begin
          Edit7.Text:=LFrm.cdsPick.FieldByName('INV_PART_NUMBER').AsString;
        end;
      end;
      1:
      begin
        LFrm.InitWithPickID(564,8);
        if LFrm.ShowModal = mrOk then
        begin
          Edit7.Text:=LFrm.cdsPick.FieldByName('inv_group_name').AsString;
        end;
      end;
      2:
      begin
        LFrm.InitWithPickID(564,7);
        if LFrm.ShowModal = mrOk then
        begin
          Edit7.Text:=LFrm.cdsPick.FieldByName('GROUP_NAME').AsString;
        end;
      end;
      3:
      begin
        LFrm.InitWithPickID(564,1);
        if LFrm.ShowModal = mrOk then
        begin
          Edit7.Text:=LFrm.cdsPick.FieldByName('CODE').AsString;
        end;
      end;
      4:
      begin
        LFrm.InitWithPickID(564,0);
        if LFrm.ShowModal = mrOk then
        begin
          Edit7.Text:=LFrm.cdsPick.FieldByName('WAREHOUSE_CODE').AsString;
        end;
      end;
      5:
      begin
        LFrm.InitWithPickID(564,4);
        if LFrm.ShowModal = mrOk then
        begin
          Edit7.Text:=LFrm.cdsPick.FieldByName('CODE').AsString;
        end;
      end;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmVMIQuery_Mod564.BitBtn4Click(Sender: TObject);
var LFrm: TfrmSinglePickList;
begin
  inherited;
  LFrm := TfrmSinglePickList.Create(Self);
  try
    case listbox1.ItemIndex of
      1:
      begin
        LFrm.InitWithPickID(564,3);
        if LFrm.ShowModal = mrOk then
        begin
          Edit1.Text:=LFrm.cdsPick.FieldByName('INV_PART_NUMBER').AsString;
        end;
      end;
      2:
      begin
        LFrm.InitWithPickID(564,7);
        if LFrm.ShowModal = mrOk then
        begin
          Edit1.Text:=LFrm.cdsPick.FieldByName('GROUP_NAME').AsString;
        end;
      end;
      5:
      begin
        LFrm.InitWithPickID(564,1);
        if LFrm.ShowModal = mrOk then
        begin
          Edit1.Text:=LFrm.cdsPick.FieldByName('code').AsString;
        end;
      end;
      6:
      begin
        LFrm.InitWithPickID(564,0);
        if LFrm.ShowModal = mrOk then
        begin
          Edit1.Text:=LFrm.cdsPick.FieldByName('WAREHOUSE_CODE').AsString;
        end;
      end;
      8:
      begin
        LFrm.InitWithPickID(564,8);
        if LFrm.ShowModal = mrOk then
        begin
          Edit1.Text:=LFrm.cdsPick.FieldByName('inv_group_name').AsString;
        end;
      end;
      9:
      begin
        LFrm.InitWithPickID(564,4);
        if LFrm.ShowModal = mrOk then
        begin
          Edit1.Text:=LFrm.cdsPick.FieldByName('CODE').AsString;
        end;
      end;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmVMIQuery_Mod564.BitBtn5Click(Sender: TObject);
var LFrm: TfrmSinglePickList;
begin
  inherited;
  LFrm := TfrmSinglePickList.Create(Self);
  try
    case listbox2.ItemIndex of
      1:
      begin
        LFrm.InitWithPickID(564,3);
        if LFrm.ShowModal = mrOk then
        begin
          Edit2.Text:=LFrm.cdsPick.FieldByName('INV_PART_NUMBER').AsString;
        end;
      end;
      2:
      begin
        LFrm.InitWithPickID(564,7);
        if LFrm.ShowModal = mrOk then
        begin
          Edit2.Text:=LFrm.cdsPick.FieldByName('GROUP_NAME').AsString;
        end;
      end;
      3:
      begin
        LFrm.InitWithPickID(564,0);
        if LFrm.ShowModal = mrOk then
        begin
          Edit2.Text:=LFrm.cdsPick.FieldByName('WAREHOUSE_CODE').AsString;
        end;
      end;
      4:
      begin
        LFrm.InitWithPickID(564,8);
        if LFrm.ShowModal = mrOk then
        begin
          Edit2.Text:=LFrm.cdsPick.FieldByName('inv_group_name').AsString;
        end;
      end;
      6:
      begin
        LFrm.InitWithPickID(564,4);
        if LFrm.ShowModal = mrOk then
        begin
          Edit2.Text:=LFrm.cdsPick.FieldByName('CODE').AsString;
        end;
      end;
      7:
      begin
        LFrm.InitWithPickID(564,6);
        if LFrm.ShowModal = mrOk then
        begin
          Edit2.Text:=LFrm.cdsPick.FieldByName('EMPL_CODE').AsString;
        end;
      end;
      8:
      begin
        LFrm.InitWithPickID(564,1);
        if LFrm.ShowModal = mrOk then
        begin
          Edit2.Text:=LFrm.cdsPick.FieldByName('CODE').AsString;
        end;
      end;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmVMIQuery_Mod564.btnCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmVMIQuery_Mod564.Button1Click(Sender: TObject);
var i:Integer;
begin
  inherited;
  if ListBox1.ItemIndex in [0,3,7] then
  begin
    for i:=1 to sgrid1.RowCount-2 do
    if sgrid1.Cells[0,i]=ListBox1.Items[ListBox1.itemindex] then
    begin
      sgrid1.Cells[1,i]:=edit1.Text;
      sgrid1.Cells[2,i]:=' and '+v_Field_List_EN[ListBox1.ItemIndex]+' like ''%'+edit1.Text+'%''';
      Exit;
    end;
    sgrid1.Cells[0,sgrid1.RowCount-1]:=ListBox1.Items[ListBox1.itemindex];
    sgrid1.Cells[1,sgrid1.RowCount-1]:=edit1.Text;
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox1.ItemIndex]+' like ''%'+edit1.Text+'%''';
    sgrid1.RowCount:=sgrid1.RowCount+1;
  end else
  if ListBox1.ItemIndex in [1,2,5,6,8,9] then
  begin
    for i:=1 to sgrid1.RowCount-2 do
    if sgrid1.Cells[0,i]=ListBox1.Items[ListBox1.itemindex] then
    begin
      sgrid1.Cells[1,i]:=edit1.Text;
      sgrid1.Cells[2,i]:=' and '+v_Field_List_EN[ListBox1.ItemIndex]+' = '''+edit1.Text+'''';
      Exit;
    end;
    sgrid1.Cells[0,sgrid1.RowCount-1]:=ListBox1.Items[ListBox1.itemindex];
    sgrid1.Cells[1,sgrid1.RowCount-1]:=edit1.Text;
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox1.ItemIndex]+' = '''+edit1.Text+'''';
    sgrid1.RowCount:=sgrid1.RowCount+1;
  end else
  if ListBox1.ItemIndex in [4] then
  begin
    for i:=1 to sgrid1.RowCount-2 do
      if sgrid1.Cells[0,i]=ListBox1.Items[ListBox1.itemindex] then
    begin
       sgrid1.Cells[1,i]:='从'+datetostr(dtpk1.date)+'到'+datetostr(dtpk2.date);
       sgrid1.Cells[2,i]:=' and '+v_Field_List_EN[ListBox1.ItemIndex]+' >= '''+datetostr(dtpk1.date)+formatdatetime(' hh:nn:ss',DTtm1.Time)
       +''' and '+v_Field_List_EN[ListBox1.ItemIndex]+' <= '''+datetostr(dtpk2.date)+
       formatdatetime(' hh:nn:ss',DTtm2.Time)+'''';
      exit;
    end;
    sgrid1.Cells[0,sgrid1.RowCount-1]:=ListBox1.Items[ListBox1.itemindex];
   sgrid1.Cells[1,sgrid1.RowCount-1]:='从'+datetostr(dtpk1.date)+'到'+datetostr(dtpk2.date);
   sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox1.ItemIndex]+' >= '''+datetostr(dtpk1.date)+formatdatetime(' hh:nn:ss',DTtm1.Time)
   +''' and '+v_Field_List_EN[ListBox1.ItemIndex]+' <= '''+datetostr(dtpk2.date)+
   formatdatetime(' hh:nn:ss',DTtm2.Time)+'''';
    sgrid1.RowCount:=sgrid1.RowCount+1;
  end;
end;

procedure TfrmVMIQuery_Mod564.Button2Click(Sender: TObject);
var i:Integer;
begin
  inherited;
  if ListBox2.ItemIndex in [0,1,2,3,4,6,7,8,9,10] then
  begin
    for i:=1 to sgrid1.RowCount-2 do
    if sgrid1.Cells[0,i]=ListBox2.Items[ListBox2.itemindex] then
    begin
      sgrid1.Cells[1,i]:=edit2.Text;
      sgrid1.Cells[2,i]:=' and '+v_Field_List_EN[ListBox2.ItemIndex]+' like ''%'+edit2.Text+'%''';
      Exit;
    end;
    sgrid1.Cells[0,sgrid1.RowCount-1]:=ListBox2.Items[ListBox2.itemindex];
    sgrid1.Cells[1,sgrid1.RowCount-1]:=edit2.Text;
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox2.ItemIndex]+' like ''%'+edit2.Text+'%''';
    sgrid1.RowCount:=sgrid1.RowCount+1;
  end else
  if ListBox2.ItemIndex in [5] then
  begin
    for i:=1 to sgrid1.RowCount-2 do
      if sgrid1.Cells[0,i]=ListBox2.Items[ListBox2.itemindex] then
    begin
       sgrid1.Cells[1,i]:='从'+datetostr(dtpk3.date)+'到'+datetostr(dtpk4.date);
       sgrid1.Cells[2,i]:=' and '+v_Field_List_EN[ListBox2.ItemIndex]+' >= '''+datetostr(dtpk3.date)+formatdatetime(' hh:nn:ss',DTtm3.Time)
       +''' and '+v_Field_List_EN[ListBox2.ItemIndex]+' <= '''+datetostr(dtpk4.date)+
       formatdatetime(' hh:nn:ss',DTtm4.Time)+'''';
      exit;
    end;
    sgrid1.Cells[0,sgrid1.RowCount-1]:=ListBox2.Items[ListBox2.itemindex];
   sgrid1.Cells[1,sgrid1.RowCount-1]:='从'+datetostr(dtpk3.date)+'到'+datetostr(dtpk4.date);
   sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox2.ItemIndex]+' >= '''+datetostr(dtpk3.date)+formatdatetime(' hh:nn:ss',DTtm3.Time)
   +''' and '+v_Field_List_EN[ListBox2.ItemIndex]+' <= '''+datetostr(dtpk4.date)+
   formatdatetime(' hh:nn:ss',DTtm4.Time)+'''';
    sgrid1.RowCount:=sgrid1.RowCount+1;
  end;
end;

procedure TfrmVMIQuery_Mod564.Button7Click(Sender: TObject);
var i:Integer;
begin
  inherited;
  for i:=1 to sgrid1.RowCount-2 do
  if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then
  begin
    sgrid1.Cells[1,i]:=edit7.Text;
    sgrid1.Cells[2,i]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' like ''%'+edit7.Text+'%''';
    Exit;
  end;
  sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
  sgrid1.Cells[1,sgrid1.RowCount-1]:=edit7.Text;
  sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' like ''%'+edit7.Text+'%''';
  sgrid1.RowCount:=sgrid1.RowCount+1;
end;

procedure TfrmVMIQuery_Mod564.ListBox1Click(Sender: TObject);
begin
  inherited;
  label2.Caption := listbox1.Items[listbox1.ItemIndex];
  bitbtn4.Visible:=listbox1.ItemIndex in [1,2,5,6,8,9];
  edit1.Visible:=listbox1.ItemIndex in [0,1,2,3,5,6,7,8,9];
  edit1.ReadOnly:=listbox1.ItemIndex in [1,2,5,6,8,9];
  label3.Visible:=listbox1.ItemIndex=4;
  label4.Visible:=listbox1.ItemIndex=4;
  dtpk1.Visible:=listbox1.ItemIndex=4;
  dtpk2.Visible:=listbox1.ItemIndex=4;
  dttm1.Visible:=listbox1.ItemIndex=4;
  dttm2.Visible:=listbox1.ItemIndex=4;
  if edit1.Visible=true then edit1.Text:='';
  if DTPk1.Visible then DTPk1.Date:=gFunc.GetSvrDateTime-15;
  if DTPk2.Visible then DTPk2.Date:=gFunc.GetSvrDateTime;
end;

procedure TfrmVMIQuery_Mod564.ListBox2Click(Sender: TObject);
begin
  inherited;
  label6.Caption:=listbox2.Items[listbox2.itemindex];
  bitbtn5.Visible:=listbox2.ItemIndex in [1,2,3,4,6,7,8];
  label5.Visible:=listbox2.ItemIndex=5;
  label1.Visible:=listbox2.ItemIndex=5;
  dtpk3.Visible:=listbox2.ItemIndex=5;
  dtpk4.Visible:=listbox2.ItemIndex=5;
  dttm3.Visible:=listbox2.ItemIndex=5;
  dttm4.Visible:=listbox2.ItemIndex=5;
  edit2.Visible:=listbox2.ItemIndex in [0,1,2,3,4,6,7,8,9,10];
  Edit2.ReadOnly:=listbox2.ItemIndex in [1,2,3,4,6,7,8];
  if Edit2.Visible=true then Edit2.Text:='';
  if dtpk3.Visible then dtpk3.Date:=gFunc.GetSvrDateTime-15;
  if dtpk4.Visible then dtpk4.Date:=gFunc.GetSvrDateTime;
end;

procedure TfrmVMIQuery_Mod564.ListBox3Click(Sender: TObject);
begin
  inherited;
  label21.Caption:=listbox3.Items[listbox3.itemindex];
  bitbtn11.Visible:=listbox3.ItemIndex in [0,1,2,3,4,5];
  edit7.Text:='';
end;

procedure TfrmVMIQuery_Mod564.N1Click(Sender: TObject);
var i:Integer;
begin
  inherited;
  for i:=sgrid1.Row to sgrid1.RowCount-2 do
    sgrid1.Rows[i]:=sgrid1.Rows[i+1];
  sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TfrmVMIQuery_Mod564.RadioGroup1Click(Sender: TObject);
var
  i:Integer;
begin
  inherited;
//  for i:=1 to sgrid1.RowCount-1 do
//    sgrid1.Rows[i].Clear;
//  sgrid1.RowCount:=2;
  case radiogroup1.ItemIndex of
  0:
    begin
      frmVMIQuery_Mod564.Caption:='材料VMI入库查询';
      groupbox1.Visible:=true;
      groupbox2.Visible:=false;
      groupbox3.Visible:=false;
      listbox1.Items.Clear;
      v_Field_List_CN := VarArrayOf(['采购订单','材料编码','材料类别','入库单号','入库日期','供 应 商','工厂','送货单号','材料组别','仓库代码']);
      v_Field_List_EN := VarArrayOf(['Data0070.PO_NUMBER','Data0017.INV_PART_NUMBER','Data0496.GROUP_NAME','Data0133.GRN_NUMBER','Data0133.create_DATE','data0023.code','data0015.warehouse_code','Data0133.DELIVER_NUMBER','Data0019.inv_group_name','Data0016.code']);
      for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
        listbox1.Items.Add(v_Field_List_CN[i]);
      listbox1.Selected[0]:=true;
    end;
  1:
    begin
      frmVMIQuery_Mod564.Caption:='材料VMI出库查询';
      groupbox1.Visible:=false;
      groupbox3.Visible:=false;
      groupbox2.Visible:=true;
      listbox2.Items.Clear;
      v_Field_List_CN := VarArrayOf(['出库单号','材料编码','材料类别','工厂','材料组别','出库日期','出库仓库','领料人员','供应商','采购订单','入库单号']);
      v_Field_List_EN := VarArrayOf(['Data0724.GON_NUMBER','Data0017.INV_PART_NUMBER','Data0496.GROUP_NAME','data0015.warehouse_code','Data0019.inv_group_name','Data0724.CREATE_DATE','Data0016.code','Data0005.EMPL_CODE','data0023.code','Data0070.PO_NUMBER','Data0133.GRN_NUMBER']);
      for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
        listbox2.Items.Add(v_Field_List_CN[i]);
      listbox2.Selected[0]:=true;
    end;
  2:
    begin
      frmVMIQuery_Mod564.Caption:='材料VMI库存查询';
      groupbox1.Visible:=false;
      groupbox2.Visible:=false;
      groupbox3.Visible:=true;
      listbox3.Items.Clear;
      v_Field_List_CN := VarArrayOf(['材料编码','材料组别','材料类别','供 应 商','工厂','仓库','材料规格','采购订单']);
      v_Field_List_EN := VarArrayOf(['Data0017.INV_PART_NUMBER','Data0019.inv_GROUP_NAME','Data0496.GROUP_NAME','data0023.code','data0015.WAREHOUSE_CODE','data0016.CODE','Data0017.INV_DESCRIPTION','Data0070.PO_NUMBER']);
      for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
        listbox3.Items.Add(v_Field_List_CN[i]);
      listbox3.Selected[0]:=true;
    end;
  end;
end;

end.
