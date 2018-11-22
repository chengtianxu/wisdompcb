unit VMIzhiruku;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseEditFrm, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, Vcl.ComCtrls, Vcl.Mask, RzEdit,
  RzBtnEdt, uRKeyBtnEdit, Vcl.Menus, Data.DB, Datasnap.DBClient,ucommfunc,uBaseSinglePickListFrm,uLookupDM;

type
  LgetRefreshClick=procedure (cds:TClientDataSet) of object;

  TfrmVMIzhiruku = class(TfrmBaseEdit)
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
    cds133: TClientDataSet;
    ds133: TDataSource;
    cds134: TClientDataSet;
    ds134: TDataSource;
    PopupMenu1: TPopupMenu;
    IQC1: TMenuItem;
    N1: TMenuItem;
    cds04: TClientDataSet;
    ds17: TDataSource;
    cdsLookUp17: TClientDataSet;
    cdsLookUp16: TClientDataSet;
    ds16: TDataSource;
    procedure redt2ButtonClick(Sender: TObject);
    procedure redt4ButtonClick(Sender: TObject);
    procedure redt3ButtonClick(Sender: TObject);
    procedure IQC1Click(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
    function Power(x, y : extended) : extended;
  public
    refresh:LgetRefreshClick;
    FEditType: Integer;//菜单
    LGRName:string; //04更新号
    procedure GetData(ARkey: string);
    function update04(table_name:string;var LsName:string):string;
    procedure Append133;
    procedure AddLookup134;
    { Public declarations }
  end;

var
  frmVMIzhiruku: TfrmVMIzhiruku;

implementation

{$R *.dfm}

uses VMIzhishuru;
procedure TfrmVMIzhiruku.PopupMenu1Popup(Sender: TObject);
begin
  inherited;
  if cds134.IsEmpty then
  begin
    N1.Enabled:=False;
    IQC1.Enabled:=True;
  end else
  begin
    N1.Enabled:=True;
    IQC1.Enabled:=True;
  end;
end;

function TfrmVMIzhiruku.Power(x, y : extended) : extended;
begin
  result := exp(y*ln(x));
end;

procedure TfrmVMIzhiruku.redt2ButtonClick(Sender: TObject);
var LFrm: TfrmSinglePickList;
begin
  LFrm := TfrmSinglePickList.Create(Self);
  try
    LFrm.InitWithPickID(564,StrToInt(redt2.DisplayPickID));
    if LFrm.ShowModal = mrOk then
    begin
      cds133.Edit;
      cds133.FieldByName('warehouse_ptr').AsInteger:=LFrm.cdsPick.FieldByName('Rkey').AsInteger;
      cds133.Post;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmVMIzhiruku.redt3ButtonClick(Sender: TObject);
var LFrm: TfrmSinglePickList;
begin
  LFrm := TfrmSinglePickList.Create(Self);
  try
    LFrm.InitWithPickID(564,StrToInt(redt3.DisplayPickID));
    if LFrm.ShowModal = mrOk then
    begin
      cds133.Edit;
      cds133.FieldByName('SUPP_PTR').AsInteger:=LFrm.cdsPick.FieldByName('Rkey').AsInteger;
      cds133.FieldByName('currency_ptr').AsInteger:=LFrm.cdsPick.FieldByName('CURRENCY_PTR').AsInteger;
      cds133.FieldByName('exch_rate').Value:=LFrm.cdsPick.FieldByName('EXCH_RATE').Value;
      cds133.Post;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmVMIzhiruku.redt4ButtonClick(Sender: TObject);
var LFrm: TfrmSinglePickList;
begin
  LFrm := TfrmSinglePickList.Create(Self);
  try
    LFrm.InitWithPickID(564,StrToInt(redt4.DisplayPickID));
    if LFrm.ShowModal = mrOk then
    begin
      cds133.Edit;
      cds133.FieldByName('currency_ptr').AsInteger:=LFrm.cdsPick.FieldByName('Rkey').AsInteger;
      cds133.FieldByName('exch_rate').Value:=LFrm.cdsPick.FieldByName('EXCH_RATE').Value;
      cds133.Post;
    end;
  finally
    LFrm.Free;
  end;
end;

function TfrmVMIzhiruku.update04(table_name: string;var LsName:string):string;
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

procedure TfrmVMIzhiruku.Append133;
var LsName:string;
begin
  LGRName:=update04('data0133',LsName);
  FEditType:=0;
  cds133.append;
  cds133.FieldByName('GRN_NUMBER').Value:=LsName;
  cds133.FieldByName('DELIVER_NUMBER').Value:='';
  cds133.FieldByName('TTYPE').Value:=3;
  cds133.FieldByName('CREATE_DATE').Value:=gFunc.GetSvrDateTime;
  cds133.FieldByName('CREATE_BY').Value:=gVar.rkey05;
  cds133.FieldByName('ship_DATE').Value:=gFunc.GetSvrDateTime;
  cds133.FieldByName('ship_BY').Value:='';
  cds133.FieldByName('REF_NUMBER').Value:='';
  cds133.FieldByName('idkey').Value := gFunc.CreateIDKey;
  cds133.FieldByName('TSTATUS').Value :=0;
  cds133.Post;
end;

procedure TfrmVMIzhiruku.btnCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmVMIzhiruku.btnSaveClick(Sender: TObject);
var Lcds:TClientDataSet;
    LsName:string;
    LPostData: OleVariant;
begin
  inherited;
  Lcds:=TClientDataSet.Create(Self);
  try
    case FEditType of
      0:  //新增
      begin
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
        cds133.Edit;
        gSvrIntf.IntfGetDataBySql('select * from data0133 where GRN_NUMBER = ''' + Trim(redt1.Text)+'''',Lcds);
        if not Lcds.IsEmpty then
        begin
          if messagedlg('入仓编号重复,可能有多台计算机同时新增,是否自动更新编号?',mtConfirmation,[mbYes,mbNo],0)=mrYes  then
          begin
            LGRName:=update04('data0133',LsName);
            cds133.FieldByName('GRN_NUMBER').Value:=LsName;
          end;
        end;
        cds133.FieldByName('ship_BY').Value:=redt6.Text;
        cds133.FieldByName('DELIVER_NUMBER').Value:=redt7.Text;
        cds133.FieldByName('ship_DATE').Value:=dtpReqDate.DateTime;
        cds133.FieldByName('REF_NUMBER').Value:=redt5.Text;
        cds133.Post;
        if cds134.IsEmpty then
        begin
          showmessage('至少有一条入仓记录');
          exit;
        end;
        //更新04
        gSvrIntf.IntfGetDataBySql('select * from data0004 where table_name=''data0133''',cds04);
        cds04.Edit;
        cds04.FieldByName('SEED_VALUE').Value:=LGRName;
        cds04.Post;
        if cds133.State in [dsEdit,dsInsert] then cds133.Post;
        if cds134.State in [dsEdit,dsInsert] then cds134.Post;
        if cds04.State in [dsEdit,dsInsert] then cds04.Post;

        LPostData := VarArrayCreate([0,2],varVariant);
        if cds133.ChangeCount > 0 then
          LPostData[0] := cds133.Delta;
        if cds134.ChangeCount > 0 then
          LPostData[1] := cds134.Delta;
        if cds04.ChangeCount > 0 then
          LPostData[2] := cds04.Delta;
        if gSvrIntf.IntfPostModData('公共基础',564,LPostData,1) then
        begin
          cds133.MergeChangeLog;
          cds134.MergeChangeLog;
          cds04.MergeChangeLog;
          ShowMessage('保存成功');
          if Assigned(refresh) then
            refresh(nil);
          Close;
        end;
      end;
      1: //编辑
      begin
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
        if cds134.IsEmpty then
        begin
          showmessage('至少有一条入仓记录');
          exit;
        end;
        cds133.Edit;
        cds133.FieldByName('ship_BY').Value:=redt6.Text;//送货人员
        cds133.FieldByName('DELIVER_NUMBER').Value:=redt7.Text; // 供应商送货单号
        cds133.FieldByName('REF_NUMBER').Value:=redt5.Text; // 备注
        cds133.FieldByName('ship_DATE').Value:=dtpReqDate.Date; //送货日期
        cds133.Post;
        if cds133.State in [dsEdit,dsInsert] then cds133.Post;
        if cds134.State in [dsEdit,dsInsert] then cds134.Post;
        if cds04.State in [dsEdit,dsInsert] then cds04.Post;

        LPostData := VarArrayCreate([0,2],varVariant);
        if cds133.ChangeCount > 0 then
          LPostData[0] := cds133.Delta;
        if cds134.ChangeCount > 0 then
          LPostData[1] := cds134.Delta;
        if cds04.ChangeCount > 0 then
          LPostData[2] := cds04.Delta;
        if gSvrIntf.IntfPostModData('公共基础',564,LPostData,1) then
        begin
          cds133.MergeChangeLog;
          cds134.MergeChangeLog;
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

procedure TfrmVMIzhiruku.AddLookup134;
var
  LLKField: TField;
  I: Integer;
begin
  gSvrIntf.IntfGetDataBySql('SELECT * FROM data0134 WHERE 1=0',cds134);
  //在数据集关闭的情况下新增加一个字段
  try
    cds134.Close;
    cds134.FieldDefs.BeginUpdate;
    for i := 0 to cds134.FieldDefList.Count - 1 do
    begin
      cds134.FieldDefList.FieldDefs[i].CreateField(Self);
    end;
    //Add New Field
   //增加新的字段
    LLKField := TStringField.Create(cds134);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'INV_PART_NUMBER';
    LLKField.KeyFields := 'INVENTORY_PTR';
    LLKField.LookupDataSet := cdsLookUp17;
    LLKField.LookupKeyFields := 'rkey';
    LLKField.LookupResultField := 'INV_PART_NUMBER';
    LLKField.DataSet := cds134;

    LLKField := TStringField.Create(cds134);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'inv_name';
    LLKField.KeyFields := 'INVENTORY_PTR';
    LLKField.LookupDataSet := cdsLookUp17;
    LLKField.LookupKeyFields := 'rkey';
    LLKField.LookupResultField := 'inv_name';
    LLKField.DataSet := cds134;

    LLKField := TStringField.Create(cds134);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'INV_DESCRIPTION';
    LLKField.KeyFields := 'INVENTORY_PTR';
    LLKField.LookupDataSet := cdsLookUp17;
    LLKField.LookupKeyFields := 'rkey';
    LLKField.LookupResultField := 'INV_DESCRIPTION';
    LLKField.DataSet := cds134;

    LLKField := TStringField.Create(cds134);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'unit_name';
    LLKField.KeyFields := 'UNIT_PTR';
    LLKField.LookupDataSet := gLookDM.cdsLK02;
    LLKField.LookupKeyFields := 'rkey';
    LLKField.LookupResultField := 'unit_name';
    LLKField.DataSet := cds134;

    LLKField := TStringField.Create(cds134);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'LOCATION';
    LLKField.KeyFields := 'LOCATION_PTR';
    LLKField.LookupDataSet := cdsLookUp16;
    LLKField.LookupKeyFields := 'rkey';
    LLKField.LookupResultField := 'LOCATION';
    LLKField.DataSet := cds134;
  finally
    cds134.FieldDefs.EndUpdate;
  end;
end;

procedure TfrmVMIzhiruku.GetData(ARkey: string);
var
  LSql33,LSql34,LSqlLK17,LsqlLK16: string;
begin
  LSqlLK17 := 'select d17.rkey,d17.INV_PART_NUMBER ,d17.inv_name,d17.INV_DESCRIPTION from Data0134 d134 ' +
              ' inner join data0017 d17 on d134.INVENTORY_PTR = d17.RKEY ' +
              ' where d134.GRN_PTR = ' + ARkey;

  LSqlLK16 := 'select d16.rkey,d16.LOCATION from Data0134 d134 ' +
              ' inner join data0016 d16 on d134.LOCATION_PTR=d16.rkey ' +
              ' where d134.GRN_PTR = ' + ARkey;
  // data0133
  LSql33 := 'select * from data0133 where rkey = ' + ARkey;

  // data0134
  LSql34 := 'select * from data0134 where GRN_PTR = ' + ARkey;



  if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSqlLK17,LSqlLK16,LSql33,LSql34]),[cdsLookUp17,cdsLookUp16,cds133,cds134]) then Exit;
  if (FEditType=0) or (FEditType=1) then
  begin
    if (not cds133.IsEmpty) and (cds133.FieldByName('IDKEY').AsString = '') then
    begin
      cds133.Edit;
      cds133.FieldByName('IDKEY').AsString := gFunc.CreateIDKey;
      cds133.Post;
    end;
    cds134.DisableControls;
    try
      cds134.First;
      while not cds134.Eof do
      begin
        cds134.Edit;
        cds134.FieldByName('D133_IDKey').AsString := cds133.FieldByName('IDKEY').AsString;
        cds134.Post;
        cds134.Next;
      end;
      cds134.First;
    finally
      cds134.EnableControls;
    end;
  end;
end;

procedure TfrmVMIzhiruku.IQC1Click(Sender: TObject);
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
  frmVMIzhishuru := TfrmVMIzhishuru.Create(Self);
  frmVMIzhishuru.whouse:=cds133.FieldByName('warehouse_ptr').Value;
  frmVMIzhishuru.init;
  frmVMIzhishuru.getdata();
  frmVMIzhishuru.Edit6.Text:='0';
  frmVMIzhishuru.Edit7.Text:='0';
  frmVMIzhishuru.Edit8.Text:='0';
  if frmVMIzhishuru.ShowModal = mrOk then
  begin
    cdsLookUp17.FieldByName('rkey').ReadOnly := False;
    cdsLookUp17.Append;
    cdsLookUp17.FieldByName('rkey').AsInteger := frmVMIzhishuru.Edit1.Tag;
    cdsLookUp17.FieldByName('INV_PART_NUMBER').AsString := frmVMIzhishuru.Edit1.Text;
    cdsLookUp17.FieldByName('inv_name').AsString := frmVMIzhishuru.Edit2.Text;
    cdsLookUp17.FieldByName('INV_DESCRIPTION').AsString := frmVMIzhishuru.Edit3.Text;
    cdsLookUp17.Post;

    cdsLookUp16.FieldByName('rkey').ReadOnly := False;
    cdsLookUp16.Append;
    cdsLookUp16.FieldByName('rkey').AsInteger := Integer(frmVMIzhishuru.ComboBox1.Items.Objects[frmVMIzhishuru.ComboBox1.ItemIndex]);
    cdsLookUp16.FieldByName('LOCATION').AsString := frmVMIzhishuru.ComboBox1.Text;
    cdsLookUp16.Post;

    cds134.Append;
    cds134.FieldByName('INVENTORY_PTR').Value:=frmVMIzhishuru.Edit1.Tag; //原材料指针0017
    cds134.FieldByName('INV_PART_NUMBER').Value:=frmVMIzhishuru.Edit1.Text; //原材料代码
    cds134.FieldByName('inv_name').Value:=frmVMIzhishuru.Edit2.Text; //原材料名称
    cds134.FieldByName('INV_DESCRIPTION').Value:=frmVMIzhishuru.Edit3.Text; //原材料材料规格
    cds134.FieldByName('LOCATION_PTR').Value:=Integer(frmVMIzhishuru.ComboBox1.Items.Objects[frmVMIzhishuru.ComboBox1.ItemIndex]); //仓库位置data0016
    cds134.FieldByName('unit_name').Value:=frmVMIzhishuru.Edit5.Text; //单位名称
    cds134.FieldByName('LOCATION').Value:=frmVMIzhishuru.ComboBox1.Text; //仓库名称
    cds134.FieldByName('UNIT_PTR').Value:=frmVMIzhishuru.Edit5.Tag; //存货单位02
    cds134.FieldByName('QUANTITY').Value:=frmVMIzhishuru.Edit6.Text; //已接收的数量
    cds134.FieldByName('tax_price').Value:=frmVMIzhishuru.Edit7.Text; //价格含税
    cds134.FieldByName('PRICE').Value:=StrToCurr(frmVMIzhishuru.Edit7.Text)/(1+strtofloat(frmVMIzhishuru.Edit8.Text)*0.01); // 价格不含税
    cds134.FieldByName('TAX_2').Value:=frmVMIzhishuru.Edit8.Text; //税率
    cds134.FieldByName('BARCODE_ID').Value:=frmVMIzhishuru.Edit9.Text;//特别要求
    cds134.FieldByName('rohs').Value:=frmVMIzhishuru.ComboBox2.Text; //环保ROHS
    cds134.FieldByName('MANU_DATE').Value:=frmVMIzhishuru.dtpReqDate.Date; //制造日期
    if frmVMIzhishuru.Edit2.Tag <>0 then
    cds134.FieldByName('EXPIRE_DATE').Value:=frmVMIzhishuru.dtpReqDate.Date+frmVMIzhishuru.Edit2.Tag; //有效保质日期
    cds134.FieldByName('D133_IDKey').Value:=cds133.FieldByName('idkey').Value;
    cds134.Post;
    frmVMIzhishuru.cds134.Data:=cds134.Data;
  end;
  DBGridEh1.DataSource := nil;
  DBGridEh1.DataSource := ds134;
end;

procedure TfrmVMIzhiruku.N1Click(Sender: TObject);
begin
  inherited;
  cds134.Delete;
end;

end.
