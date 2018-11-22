unit zhiruku_Mod33;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseEditFrm,ucommfunc,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB,
  Datasnap.DBClient, Vcl.Menus, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Mask, RzEdit, RzBtnEdt, uRKeyBtnEdit,
  Vcl.Buttons, Vcl.ExtCtrls,uBaseSinglePickListFrm,uLookupDM;

type
  LgetRefreshClick=procedure (cds:TClientDataSet) of object;
  Tfrmzhiruku_Mod33 = class(TfrmBaseEdit)
    Panel1: TPanel;
    Label1: TLabel;
    Label12: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label14: TLabel;
    Label7: TLabel;
    Label13: TLabel;
    Label16: TLabel;
    Label3: TLabel;
    redt1: TRKeyRzBtnEdit;
    redt2: TRKeyRzBtnEdit;
    redt3: TRKeyRzBtnEdit;
    redt4: TRKeyRzBtnEdit;
    redt5: TRKeyRzBtnEdit;
    redt6: TRKeyRzBtnEdit;
    redt7: TRKeyRzBtnEdit;
    redt8: TRKeyRzBtnEdit;
    dtpReqDate: TDateTimePicker;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N3: TMenuItem;
    N2: TMenuItem;
    cds456: TClientDataSet;
    ds456: TDataSource;
    cds22: TClientDataSet;
    ds22: TDataSource;
    cds04: TClientDataSet;
    ds17: TDataSource;
    cdsLookUp17: TClientDataSet;
    ds16: TDataSource;
    cdsLookUp16: TClientDataSet;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    cds28: TClientDataSet;
    procedure redt4ButtonClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure redt3ButtonClick(Sender: TObject);
  private
    { Private declarations }
    function Power(x, y : extended) : extended;
    function find_maxdate():TDatetime; //财务库存截数最大日期
  public
    { Public declarations }
    refresh:LgetRefreshClick;
    FEditType: Integer;//菜单
    LGRName:string; //04更新号
    procedure GetData(ARkey: string);
    function update04(table_name:string;var LsName:string):string;
    procedure Append456;
    procedure AddLookup22;
  end;

var
  frmzhiruku_Mod33: Tfrmzhiruku_Mod33;

implementation

{$R *.dfm}

uses zhishuru_Mod33;


{ Tfrmzhiruku_Mod33 }

procedure Tfrmzhiruku_Mod33.AddLookup22;
var
  LLKField: TField;
  I: Integer;
begin
  gSvrIntf.IntfGetDataBySql('SELECT * FROM data0022 WHERE 1=0',cds22);
  //在数据集关闭的情况下新增加一个字段
  try
    cds22.Close;
    cds22.FieldDefs.BeginUpdate;
    for i := 0 to cds22.FieldDefList.Count - 1 do
    begin
      cds22.FieldDefList.FieldDefs[i].CreateField(Self);
    end;
    //Add New Field
   //增加新的字段
    LLKField := TStringField.Create(cds22);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'INV_PART_NUMBER';
    LLKField.KeyFields := 'INVENTORY_PTR';
    LLKField.LookupDataSet := cdsLookUp17;
    LLKField.LookupKeyFields := 'rkey';
    LLKField.LookupResultField := 'INV_PART_NUMBER';
    LLKField.DataSet := cds22;

    LLKField := TStringField.Create(cds22);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'inv_name';
    LLKField.KeyFields := 'INVENTORY_PTR';
    LLKField.LookupDataSet := cdsLookUp17;
    LLKField.LookupKeyFields := 'rkey';
    LLKField.LookupResultField := 'inv_name';
    LLKField.DataSet := cds22;

    LLKField := TStringField.Create(cds22);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'INV_DESCRIPTION';
    LLKField.KeyFields := 'INVENTORY_PTR';
    LLKField.LookupDataSet := cdsLookUp17;
    LLKField.LookupKeyFields := 'rkey';
    LLKField.LookupResultField := 'INV_DESCRIPTION';
    LLKField.DataSet := cds22;

    LLKField := TStringField.Create(cds22);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'SHELF_LIFE';
    LLKField.KeyFields := 'INVENTORY_PTR';
    LLKField.LookupDataSet := cdsLookUp17;
    LLKField.LookupKeyFields := 'rkey';
    LLKField.LookupResultField := 'SHELF_LIFE';
    LLKField.DataSet := cds22;

    LLKField := TStringField.Create(cds22);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'unit_name';
    LLKField.KeyFields := 'LOCATION_PTR_FROM';
    LLKField.LookupDataSet := gLookDM.cdsLK02;
    LLKField.LookupKeyFields := 'rkey';
    LLKField.LookupResultField := 'unit_name';
    LLKField.DataSet := cds22;

    LLKField := TStringField.Create(cds22);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'LOCATION';
    LLKField.KeyFields := 'LOCATION_PTR';
    LLKField.LookupDataSet := cdsLookUp16;
    LLKField.LookupKeyFields := 'rkey';
    LLKField.LookupResultField := 'LOCATION';
    LLKField.DataSet := cds22;
  finally
    cds22.FieldDefs.EndUpdate;
  end;
end;

procedure Tfrmzhiruku_Mod33.Append456;
var LsName:string;
begin
  LGRName:=update04('data0456',LsName);
  FEditType:=0;
  cds456.append;
  cds456.FieldByName('GRN_NUMBER').Value:=LsName;
  cds456.FieldByName('DELIVER_NUMBER').Value:='';
  cds456.FieldByName('TTYPE').Value:=3;
  cds456.FieldByName('CREATE_DATE').Value:=gFunc.GetSvrDateTime;
  cds456.FieldByName('CREATE_BY').Value:=gVar.rkey05;
  cds456.FieldByName('ship_DATE').Value:=gFunc.GetSvrDateTime;
  cds456.FieldByName('ship_BY').Value:='';
  cds456.FieldByName('REF_NUMBER').Value:='';
  cds456.FieldByName('idkey').Value := gFunc.CreateIDKey;
  cds456.FieldByName('STATUS').Value := 1;
  cds456.Post;
  dtpReqDate.DateTime:=gFunc.GetSvrDateTime;
end;

procedure Tfrmzhiruku_Mod33.btnCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure Tfrmzhiruku_Mod33.btnSaveClick(Sender: TObject);
var Lcds:TClientDataSet;
    LsName:string;
    LPostData: OleVariant;
    LmaxDate:TDateTime;
begin
  inherited;
  Lcds:=TClientDataSet.Create(Self);
  try
    if trim(redt1.Text)='' then
    begin
      showmessage('入库号不能为空...');
      exit;
    end;
    if trim(redt7.Text)='' then
    begin
      showmessage('送货单号不能为空...');
      exit;
    end;
    if (Trim(redt2.Text)='') then
    begin
      ShowMessage('工厂不能留空');
      Exit;
    end;
    if (Trim(redt3.Text)='') then
    begin
      ShowMessage('供应商不能留空。。');
      Exit;
    end;
    if (Trim(redt4.Text)='') then
    begin
      ShowMessage('币种不能留空。。');
      Exit;
    end;
    if cds22.IsEmpty then
    begin
      showmessage('至少需要一条入仓记录!');
      exit;
    end;
    LmaxDate:=find_maxdate;
    if LmaxDate<>Null then
    if dtpReqDate.DateTime < LmaxDate then
    begin
      ShowMessage('送货日期必须大于财务库存截数最大日期!');
      exit;
    end;
    case FEditType of
      0:  //新增
      begin
        cds456.Edit;
        gSvrIntf.IntfGetDataBySql('select * from data0456 where GRN_NUMBER = ''' + Trim(redt1.Text)+'''',Lcds);
        if not Lcds.IsEmpty then
        begin
          if messagedlg('入仓编号重复,可能有多台计算机同时新增,是否自动更新编号?',mtConfirmation,[mbYes,mbNo],0)=mrYes  then
          begin
            LGRName:=update04('data0456',LsName);
            cds456.FieldByName('GRN_NUMBER').Value:=LsName;
          end;
        end;
        cds456.FieldByName('ship_BY').Value:=redt6.Text;
        cds456.FieldByName('DELIVER_NUMBER').Value:=redt7.Text;
        cds456.FieldByName('STATUS').Value:=1;
        if checkbox2.Checked then
          cds456.FieldByName('PRINTED').Value:='Y'
        else
          cds456.FieldByName('PRINTED').Value:='N';
        cds456.FieldByName('ship_DATE').Value:=dtpReqDate.DateTime;
        cds456.FieldByName('REF_NUMBER').Value:=Trim(redt5.Text);
        cds456.Post;
        //更新04
        gSvrIntf.IntfGetDataBySql('select * from data0004 where table_name=''data0456''',cds04);
        cds04.Edit;
        cds04.FieldByName('SEED_VALUE').Value:=LGRName;
        cds04.Post;
        if cds456.State in [dsEdit,dsInsert] then cds456.Post;
        if cds22.State in [dsEdit,dsInsert] then cds22.Post;
        if cds04.State in [dsEdit,dsInsert] then cds04.Post;

        LPostData := VarArrayCreate([0,2],varVariant);
        if cds456.ChangeCount > 0 then
          LPostData[0] := cds456.Delta;
        if cds22.ChangeCount > 0 then
          LPostData[1] := cds22.Delta;
        if cds04.ChangeCount > 0 then
          LPostData[2] := cds04.Delta;
        if gSvrIntf.IntfPostModData('公共基础',33,LPostData,2) then
        begin
          cds456.MergeChangeLog;
          cds22.MergeChangeLog;
          cds04.MergeChangeLog;
          ShowMessage('保存成功');
          if Assigned(refresh) then
            refresh(nil);
          Close;
        end;
      end;
      1: //编辑
      begin
        cds456.Edit;
        cds456.FieldByName('ship_BY').Value:=redt6.Text;//送货人员
        cds456.FieldByName('DELIVER_NUMBER').Value:=redt7.Text; // 供应商送货单号
        cds456.FieldByName('REF_NUMBER').Value:=redt5.Text; // 备注
        cds456.FieldByName('ship_DATE').Value:=dtpReqDate.Date; //送货日期
        if checkbox2.Checked then
          cds456.FieldByName('PRINTED').Value:='Y'
        else
          cds456.FieldByName('PRINTED').Value:='N';
        cds456.Post;
        if cds456.State in [dsEdit,dsInsert] then cds456.Post;
        if cds22.State in [dsEdit,dsInsert] then cds22.Post;
        if cds04.State in [dsEdit,dsInsert] then cds04.Post;

        LPostData := VarArrayCreate([0,2],varVariant);
        if cds456.ChangeCount > 0 then
          LPostData[0] := cds456.Delta;
        if cds22.ChangeCount > 0 then
          LPostData[1] := cds22.Delta;
        if cds04.ChangeCount > 0 then
          LPostData[2] := cds04.Delta;
        if gSvrIntf.IntfPostModData('公共基础',33,LPostData,2) then
        begin
          if cds456.ChangeCount > 0 then cds456.MergeChangeLog;
          if cds22.ChangeCount > 0 then cds22.MergeChangeLog;
          if cds04.ChangeCount > 0 then cds04.MergeChangeLog;
          ShowMessage('保存成功');
          if Assigned(refresh) then
            refresh(nil);
          Close;
        end;
      end;
    end;
  finally
    Lcds.Free;
  end;
end;

function Tfrmzhiruku_Mod33.find_maxdate: TDatetime;
var Lcds:TClientDataSet;
begin
  Lcds:=TClientDataSet.Create(Self);
  try
    gSvrIntf.IntfGetDataBySql('SELECT isnull(MAX(MATL_DATE),0) AS MATL_DATE FROM Data0444',Lcds);
    if not Lcds.IsEmpty  then
      Result:=Lcds.fieldbyname('MATL_DATE').AsDateTime
    else Result:=Null;
  finally
    Lcds.Free;
  end;
end;

procedure Tfrmzhiruku_Mod33.GetData(ARkey: string);
var
  LSq456,LSq22,LSqlLK17,LsqlLK16: string;
begin
  LSqlLK17 := 'select d17.rkey,d17.INV_PART_NUMBER ,d17.inv_name,d17.INV_DESCRIPTION,d17.SHELF_LIFE from Data0022 d22 ' +
              ' inner join data0017 d17 on d22.INVENTORY_PTR = d17.RKEY ' +
              ' where d22.GRN_PTR = ' + ARkey;

  LSqlLK16 := 'select distinct d16.rkey,d16.LOCATION from Data0022 d22 ' +
              ' inner join data0016 d16 on d22.LOCATION_PTR=d16.rkey ' +
              ' where d22.GRN_PTR = ' + ARkey;
  // data0133
  LSq456 := 'select * from data0456 where rkey = ' + ARkey;

  // data0134
  LSq22 := 'select * from data0022 where GRN_PTR = ' + ARkey;

  if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSqlLK17,LSqlLK16,LSq456,LSq22]),[cdsLookUp17,cdsLookUp16,cds456,cds22]) then Exit;

  if (FEditType=0) or (FEditType=1) then
  begin
    if (not cds456.IsEmpty) and (cds456.FieldByName('IDKEY').AsString = '') then
    begin
      cds456.Edit;
      cds456.FieldByName('IDKEY').AsString := gFunc.CreateIDKey;
      cds456.Post;
    end;
    cds22.DisableControls;
    try
      cds22.First;
      while not cds22.Eof do
      begin
        cds22.Edit;
        cds22.FieldByName('D456_IDKey').AsString := cds456.FieldByName('IDKEY').AsString;
        cds22.Post;
        cds22.Next;
      end;
      cds22.First;
    finally
      cds22.EnableControls;
    end;
  end;
end;

procedure Tfrmzhiruku_Mod33.N1Click(Sender: TObject);
var Lsql28:string;
begin
  inherited;
  if (Trim(redt2.Text)='') then
  begin
    ShowMessage('请确定工厂。。');
    Exit;
  end;
  if (Trim(redt3.Text)='') then
  begin
    ShowMessage('请确定供应商。。');
    Exit;
  end;
  if (Trim(redt4.Text)='') then
  begin
    ShowMessage('请确定币种。。');
    Exit;
  end;
  frmzhishuru_Mod33 := Tfrmzhishuru_Mod33.Create(Self);
    frmzhishuru_Mod33.whouse:=cds456.FieldByName('warehouse_ptr').Value;
    frmzhishuru_Mod33.init;
    if frmzhishuru_Mod33.ShowModal = mrOk then
    begin
      cdsLookUp17.FieldByName('rkey').ReadOnly := False;
      cdsLookUp17.Append;
      cdsLookUp17.FieldByName('rkey').AsInteger := frmzhishuru_Mod33.Edit1.Tag;
      cdsLookUp17.FieldByName('INV_PART_NUMBER').AsString := frmzhishuru_Mod33.Edit1.Text;
      cdsLookUp17.FieldByName('inv_name').AsString := frmzhishuru_Mod33.Edit2.Text;
      cdsLookUp17.FieldByName('INV_DESCRIPTION').AsString := frmzhishuru_Mod33.Edit3.Text;
      cdsLookUp17.FieldByName('SHELF_LIFE').AsInteger := frmzhishuru_Mod33.Edit2.Tag;
      cdsLookUp17.Post;

      cdsLookUp16.FieldByName('rkey').ReadOnly := False;
      cdsLookUp16.Append;
      cdsLookUp16.FieldByName('rkey').AsInteger := Integer(frmzhishuru_Mod33.ComboBox1.Items.Objects[frmzhishuru_Mod33.ComboBox1.ItemIndex]);
      cdsLookUp16.FieldByName('LOCATION').AsString := frmzhishuru_Mod33.ComboBox1.Text;
      cdsLookUp16.Post;

      cds22.Append;
      cds22.FieldByName('INVENTORY_PTR').Value:=frmzhishuru_Mod33.Edit1.Tag; //原材料指针0017
      cds22.FieldByName('INV_PART_NUMBER').Value:=frmzhishuru_Mod33.Edit1.Text; //原材料代码
      cds22.FieldByName('inv_name').Value:=frmzhishuru_Mod33.Edit2.Text; //原材料名称
      cds22.FieldByName('INV_DESCRIPTION').Value:=frmzhishuru_Mod33.Edit3.Text; //原材料材料规格
      cds22.FieldByName('LOCATION_PTR').Value:=Integer(frmzhishuru_Mod33.ComboBox1.Items.Objects[frmzhishuru_Mod33.ComboBox1.ItemIndex]); //仓库位置data0016
      cds22.FieldByName('LOCATION').Value:=frmzhishuru_Mod33.ComboBox1.Text; //仓库名称
      cds22.FieldByName('unit_name').Value:=frmzhishuru_Mod33.Edit5.Text; //单位名称
      cds22.FieldByName('LOCATION_PTR_FROM').Value:=frmzhishuru_Mod33.Edit5.Tag; //存货单位02
      cds22.FieldByName('QUANTITY').Value:=frmzhishuru_Mod33.Edit6.Text; //已接收的数量
      cds22.FieldByName('tax_price').Value:=frmzhishuru_Mod33.Edit7.Text; //价格含税
      cds22.FieldByName('PRICE').Value:=StrToCurr(frmzhishuru_Mod33.Edit7.Text)/(1+strtofloat(frmzhishuru_Mod33.Edit8.Text)*0.01); // 价格不含税
      cds22.FieldByName('TAX_2').Value:=frmzhishuru_Mod33.Edit8.Text; //税率
      cds22.FieldByName('BARCODE_ID').Value:=frmzhishuru_Mod33.Edit9.Text;//特别要求
      cds22.FieldByName('rohs').Value:=frmzhishuru_Mod33.ComboBox2.Text; //环保ROHS
      cds22.FieldByName('TDATE').Value:=frmzhishuru_Mod33.dtpReqDate.Date; //制造日期
      Lsql28:='select qte_price2 from data0028 where inventory_ptr = '
      + Trim(IntToStr(frmzhishuru_Mod33.Edit1.Tag))
      +' and supplier_ptr='+cds456.FieldByName('SUPP_PTR').AsString;
      gSvrIntf.IntfGetDataBySql(Lsql28,cds28);
      if not cds28.IsEmpty then
      begin
        cds22.FieldByName('EXPIRE_DATE').Value:=frmzhishuru_Mod33.dtpReqDate.Date+cds28.FieldByName('qte_price2').Value; //有效保质日期
      end else
        cds22.FieldByName('EXPIRE_DATE').Value:=frmzhishuru_Mod33.dtpReqDate.Date+frmzhishuru_Mod33.Edit2.Tag; //有效保质日期
      cds22.FieldByName('D456_IDKey').Value:=cds456.FieldByName('idkey').Value;
      cds22.Post;
    end;
    DBGridEh1.DataSource := nil;
    DBGridEh1.DataSource := ds22;
end;

procedure Tfrmzhiruku_Mod33.N2Click(Sender: TObject);
begin
  inherited;
  cds22.Delete;
end;

procedure Tfrmzhiruku_Mod33.N3Click(Sender: TObject);
var Lsql28:string;
begin
  inherited;
  frmzhishuru_Mod33 := Tfrmzhishuru_Mod33.Create(Self);
  frmzhishuru_Mod33.whouse:=cds456.FieldByName('warehouse_ptr').Value;
  frmzhishuru_Mod33.init;
  frmzhishuru_Mod33.Edit1.Tag:=cds22.FieldByName('INVENTORY_PTR').Value;
  frmzhishuru_Mod33.Edit1.Text:=cds22.FieldByName('INV_PART_NUMBER').AsString;
  frmzhishuru_Mod33.Edit2.Text:=cds22.FieldByName('inv_name').AsString;
  frmzhishuru_Mod33.Edit3.Text:=cds22.FieldByName('INV_DESCRIPTION').AsString;
  frmzhishuru_Mod33.Edit5.Text:=cds22.FieldByName('unit_name').AsString;
  frmzhishuru_Mod33.Edit5.Tag:=cds22.FieldByName('LOCATION_PTR_FROM').Value;
  frmzhishuru_Mod33.Edit6.Text:=cds22.FieldByName('QUANTITY').AsString;
  frmzhishuru_Mod33.Edit7.Text:=cds22.FieldByName('tax_price').AsString;
  frmzhishuru_Mod33.Edit8.Text:=cds22.FieldByName('TAX_2').AsString;
  frmzhishuru_Mod33.Edit9.Text:=cds22.FieldByName('BARCODE_ID').AsString;
  frmzhishuru_Mod33.ComboBox1.ItemIndex:=frmzhishuru_Mod33.combobox1.Items.IndexOf(cds22.FieldByName('LOCATION').AsString);
  frmzhishuru_Mod33.dtpReqDate.Date:=cds22.FieldByName('TDATE').AsDateTime;
  frmzhishuru_Mod33.Edit2.Tag:=cds22.FieldByName('SHELF_LIFE').Value;
  frmzhishuru_Mod33.BitBtn2.Enabled:=False;
  if frmzhishuru_Mod33.ShowModal = mrOk then
  begin
    cdsLookUp17.FieldByName('rkey').ReadOnly := False;
    cdsLookUp17.Append;
    cdsLookUp17.FieldByName('rkey').AsInteger := frmzhishuru_Mod33.Edit1.Tag;
    cdsLookUp17.FieldByName('INV_PART_NUMBER').AsString := frmzhishuru_Mod33.Edit1.Text;
    cdsLookUp17.FieldByName('inv_name').AsString := frmzhishuru_Mod33.Edit2.Text;
    cdsLookUp17.FieldByName('INV_DESCRIPTION').AsString := frmzhishuru_Mod33.Edit3.Text;
    cdsLookUp17.FieldByName('SHELF_LIFE').AsInteger := frmzhishuru_Mod33.Edit2.Tag;
    cdsLookUp17.Post;

    cdsLookUp16.FieldByName('rkey').ReadOnly := False;
    cdsLookUp16.Append;
    cdsLookUp16.FieldByName('rkey').AsInteger := Integer(frmzhishuru_Mod33.ComboBox1.Items.Objects[frmzhishuru_Mod33.ComboBox1.ItemIndex]);
    cdsLookUp16.FieldByName('LOCATION').AsString := frmzhishuru_Mod33.ComboBox1.Text;
    cdsLookUp16.Post;

    cds22.Edit;
    cds22.FieldByName('INVENTORY_PTR').Value:=frmzhishuru_Mod33.Edit1.Tag; //原材料指针0017
    cds22.FieldByName('INV_PART_NUMBER').Value:=frmzhishuru_Mod33.Edit1.Text; //原材料代码
    cds22.FieldByName('inv_name').Value:=frmzhishuru_Mod33.Edit2.Text; //原材料名称
    cds22.FieldByName('INV_DESCRIPTION').Value:=frmzhishuru_Mod33.Edit3.Text; //原材料材料规格
    cds22.FieldByName('LOCATION_PTR').Value:=Integer(frmzhishuru_Mod33.ComboBox1.Items.Objects[frmzhishuru_Mod33.ComboBox1.ItemIndex]); //仓库位置data0016
    cds22.FieldByName('LOCATION').AsString:=frmzhishuru_Mod33.ComboBox1.Text; //仓库名称
    cds22.FieldByName('unit_name').Value:=frmzhishuru_Mod33.Edit5.Text; //单位名称
    cds22.FieldByName('LOCATION_PTR_FROM').Value:=frmzhishuru_Mod33.Edit5.Tag; //存货单位02
    cds22.FieldByName('QUANTITY').Value:=frmzhishuru_Mod33.Edit6.Text; //已接收的数量
    cds22.FieldByName('tax_price').Value:=frmzhishuru_Mod33.Edit7.Text; //价格含税
    cds22.FieldByName('PRICE').Value:=StrToCurr(frmzhishuru_Mod33.Edit7.Text)/(1+strtofloat(frmzhishuru_Mod33.Edit8.Text)*0.01); // 价格不含税
    cds22.FieldByName('TAX_2').Value:=frmzhishuru_Mod33.Edit8.Text; //税率
    cds22.FieldByName('BARCODE_ID').Value:=frmzhishuru_Mod33.Edit9.Text;//特别要求
    cds22.FieldByName('rohs').Value:=frmzhishuru_Mod33.ComboBox2.Text; //环保ROHS
    cds22.FieldByName('TDATE').Value:=frmzhishuru_Mod33.dtpReqDate.Date; //制造日期
    Lsql28:='select qte_price2 from data0028 where inventory_ptr = '
    + Trim(IntToStr(frmzhishuru_Mod33.Edit1.Tag))
    +' and supplier_ptr='+cds456.FieldByName('SUPP_PTR').AsString;
    gSvrIntf.IntfGetDataBySql(Lsql28,cds28);
    if not cds28.IsEmpty then
    begin
      cds22.FieldByName('EXPIRE_DATE').Value:=frmzhishuru_Mod33.dtpReqDate.Date+cds28.FieldByName('qte_price2').Value; //有效保质日期
    end else
      cds22.FieldByName('EXPIRE_DATE').Value:=frmzhishuru_Mod33.dtpReqDate.Date+frmzhishuru_Mod33.Edit2.Tag; //有效保质日期
    cds22.Post;
  end;
  DBGridEh1.DataSource := nil;
  DBGridEh1.DataSource := ds22;
end;

procedure Tfrmzhiruku_Mod33.PopupMenu1Popup(Sender: TObject);
begin
  inherited;
  if cds22.IsEmpty then
  begin
    N1.Enabled:=True;
    N2.Enabled:=False;
    N3.Enabled:=False;
  end else
  begin
    N1.Enabled:=True;
    N2.Enabled:=True;
    N3.Enabled:=True;
  end;
end;

function Tfrmzhiruku_Mod33.Power(x, y: extended): extended;
begin
  result := exp(y*ln(x));
end;

procedure Tfrmzhiruku_Mod33.redt3ButtonClick(Sender: TObject);
var LFrm: TfrmSinglePickList;
begin
  LFrm := TfrmSinglePickList.Create(Self);
  try
    LFrm.InitWithPickID(33,StrToInt(redt3.DisplayPickID));
    if LFrm.ShowModal = mrOk then
    begin
      cds456.Edit;
      cds456.FieldByName('SUPP_PTR').AsInteger:=LFrm.cdsPick.FieldByName('Rkey').AsInteger;
      cds456.FieldByName('currency_ptr').AsInteger:=LFrm.cdsPick.FieldByName('CURRENCY_PTR').AsInteger;
      cds456.FieldByName('exch_rate').Value:=LFrm.cdsPick.FieldByName('EXCH_RATE').Value;
      cds456.Post;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure Tfrmzhiruku_Mod33.redt4ButtonClick(Sender: TObject);
var LFrm: TfrmSinglePickList;
begin
  LFrm := TfrmSinglePickList.Create(Self);
  try
    LFrm.InitWithPickID(33,StrToInt(redt4.DisplayPickID));
    if LFrm.ShowModal = mrOk then
    begin
      cds456.Edit;
      cds456.FieldByName('currency_ptr').AsInteger:=LFrm.cdsPick.FieldByName('Rkey').AsInteger;
      cds456.FieldByName('exch_rate').Value:=LFrm.cdsPick.FieldByName('EXCH_RATE').Value;
      cds456.Post;
    end;
  finally
    LFrm.Free;
  end;
end;

function Tfrmzhiruku_Mod33.update04(table_name: string;
  var LsName: string): string;
var
  i,v_length:integer;
  v_last,v_seed,new_seed:string;
begin
  if not gSvrIntf.IntfGetDataBySql('select * from data0004 where table_name='''+table_name+'''',cds04) then Exit;
  if not cds04.IsEmpty then
  begin
    v_seed:=cds04.FieldByName('SEED_VALUE').AsString;
    LsName:=v_seed;
    if cds04.FieldByName('SEED_FLAG').Value<>1 then
    begin
      v_length := length(v_seed);
      for i := v_length downto 1 do
      if (copy(v_seed,i,1)<'0') or (copy(v_seed,i,1)>'9') then  //如果不是数字
      begin
        v_last := floattostr(power(10,v_length)+strtofloat(copy(v_seed,i+1,v_length-i))+1); //后缀加1
        new_seed := copy(v_seed,1,i)+copy(v_last,i+2,v_length-i); //使前缀不变后缀加1
        break;
      end
      else
      if i=1 then //如果第一位仍然是数字
        begin
         v_last := floattostr(power(10,v_length)+strtofloat(v_seed)+1);
         new_seed := copy(v_last,2,v_length);
        end;
    end;
  end;
  result:=new_seed;
end;

end.
