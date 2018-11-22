unit Edit_Data0280;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, StdCtrls, ExtCtrls,db, Grids, ADODB, Spin, Buttons,
    OleServer,Excel2000,ComObj;

type
  TfrmEdit_Data0280 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    rgStatus: TRadioGroup;
    edtName: TEdit;
    edtDesc: TEdit;
    Label4: TLabel;
    comboxDatatype: TComboBox;
    StringGrid1: TStringGrid;
    Label6: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    panelRow: TPanel;
    panelCol: TPanel;
    Button1: TButton;
    btnSave: TButton;
    btnCancel: TButton;
    spBtnToExcel: TSpeedButton;
    edtFX: TEdit;
    edtFY: TEdit;
    spbtnX: TSpeedButton;
    spBtnY: TSpeedButton;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    SpeedButton1: TSpeedButton;
    spBtnCheck: TSpeedButton;
    procedure btnSaveClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid1Exit(Sender: TObject);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure btnCancelClick(Sender: TObject);
    procedure spBtnToExcelClick(Sender: TObject);
    procedure spbtnXClick(Sender: TObject);
    procedure edtNameChange(Sender: TObject);
    procedure spBtnYClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure edtDescChange(Sender: TObject);
    procedure StringGrid1SetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure spBtnCheckClick(Sender: TObject);
  private
    { Private declarations }
    iFlag:byte;//编辑状态0。浏览 1。编辑
    FormInit:boolean;
    Run_Mode:byte;//进入模式 1。浏览，2。新增，3。编辑
    xDataType:byte;//X的数据类型
    procedure Set_Run_Mode;//设置窗体各编辑框的模式的
    function Check_Unique_Value(KeyValue:string):boolean; //验证类别名称是否已经存在数据表中,true，不存在，false存在
    function Check_Before_Post:boolean;//保存前检验数据完整性
    function Check_Date_Type(Value:string):boolean;//检验 数据类型
    function Get_X_Data_Type(xValue:string):byte;
    procedure Set_First_Row_Value;//设置第一行的数值

  public
    { Public declarations }
   //入口函数，enter_mode进入模式 1。浏览，2。新增，3。编辑
    procedure Enter(EnterMode:byte);
end;

var
  frmEdit_Data0280: TfrmEdit_Data0280;

implementation
uses common,constVar,Main_098,MyClass,SetRowCol;
{$R *.dfm}

{ TfrmEdit_Data0277 }

procedure TfrmEdit_Data0280.Enter(EnterMode: byte);
var vrow,vcol:integer; sqlstr:string;
begin
  //直接从数据表中获取数据
  iFlag:=0;//浏览状态
  FormInit:= true;
  Run_Mode:= EnterMode;
  if Run_Mode in [em_Browse,em_Edit,em_copy] then //如果是浏览或编辑记录
  begin
    with frmMain_098 do begin
      if Run_Mode<> em_copy then
      edtName.Text := Is_Null(adsMaster.fieldbyName('ENG_TABLE_NAME').AsString,'');
      edtDesc.Text := Is_Null(adsMaster.fieldbyName('ENG_TABLE_Desc').AsString,'');
      rgStatus.ItemIndex:= Is_Null(adsMaster.fieldbyName('ENG_TABLE_STATUS').AsInteger,1)-1;
      panelRow.Caption := Is_Null(adsMaster.fieldbyName('ROW_HEIGHT').AsString,'');
      panelCol.Caption := Is_Null(adsMaster.fieldbyName('COL_WIDTH').AsString,'');
      comboxDatatype.ItemIndex := adsMaster.fieldbyName('Data_type').AsInteger-1;
      edtFX.Text := Param_rKey_To_Name(Is_Null(adsMaster.fieldbyName('FX').value,-1));
      if adsMaster.fieldbyName('Fy').IsNull then
        edtFY.Text := ''
      else
        edtFY.Text := Param_rKey_To_Name(adsMaster.fieldbyName('FY').value);

      Stringgrid1.RowCount :=adsMaster.fieldbyname('row_height').asinteger+1;
      Stringgrid1.colCount :=adsMaster.fieldbyname('col_width').asinteger+1;
      PanelRow.Caption :=adsMaster.fieldbyname('row_height').asstring;
      PanelCol.Caption :=adsMaster.fieldbyname('col_width').asstring;
      for vrow:=1 to adsMaster.fieldbyname('row_height').asinteger do
        Stringgrid1.Cells[0,vrow]:=inttostr(vrow);
      for vcol:=1 to adsMaster.fieldbyname('col_width').asinteger do
        Stringgrid1.Cells[vcol,0]:=inttostr(vcol);

      MyDataClass.OpenDataSetByPara(adsMaster.FieldByName('rKey').Value,adsData0282);
      adsdata0282.first;
      while not adsdata0282.eof do
      begin
        vrow:=adsdata0282.fieldbyname('row_index').asinteger;
        vcol:=adsdata0282.fieldbyname('col').asinteger;
        Stringgrid1.Cells[vcol,vrow]:=adsdata0282.fieldbyname('Tvalue').asstring;
        adsdata0282.next;
      end;
      if Run_Mode = em_copy then
        MyDataClass.OpenDataSetByPara(-1,frmMain_098.adsData0282);
    end
  end
  else if Run_Mode = em_Add then //如果是新增
  begin
    panelRow.Caption := '3';
    panelCol.Caption := '3';
    MyDataClass.OpenDataSetByPara(-1,frmMain_098.adsData0282);
    Set_First_Row_Value;//设置第一行的数值
//    edtFY.Text:= ENG_NULL_VALUE;
  end;
  Set_Run_Mode;
  FormInit:= false;
  Showmodal;
end;

procedure TfrmEdit_Data0280.btnSaveClick(Sender: TObject);
var i,j:integer;
begin
  if not Check_Before_Post then //检验数据
    abort;
  if iFlag = 1 then //编辑状态
  begin
    if Run_Mode in [em_Add,em_copy] then //如果是新增记录，那么就要验证类别是否重复
      if not Check_Unique_Value(trim(edtName.Text)) then abort;
    with frmMain_098 do begin
      if run_Mode in [em_Add,em_copy] then //新增
        adsMaster.Append
      else  if run_Mode = em_Edit then //编辑
      begin
        adsMaster.Locate('ENG_TABLE_NAME',trim(edtName.Text),[loCaseInsensitive]);//查找的记录数值必须完全匹配
        adsMaster.Edit;
      end;
  //数据赋值
      adsMaster.FieldByName('ENG_TABLE_NAME').Value := edtName.Text;
      adsMaster.FieldByName('ENG_TABLE_Desc').Value := trim(edtName.Text)+'('+trim(edtFX.Text)+' , '+trim(edtFy.Text)+')';//edtDesc.Text;
      adsMaster.fieldbyName('ENG_TABLE_STATUS').AsInteger := rgStatus.ItemIndex +1;
      adsMaster.FieldByName('Data_Type').Value := comboxDatatype.ItemIndex+1;
      adsMaster.FieldByName('ROW_HEIGHT').Value := panelRow.caption;
      adsMaster.FieldByName('COL_WIDTH').Value := panelCol.Caption;
      adsMaster.FieldByName('FX').Value := Param_Name_To_rKey(edtFX.Text);
      if trim(edtFY.Text)= '' then
        adsMaster.FieldByName('FY').Value := NULL
      else
        adsMaster.FieldByName('FY').Value := Param_Name_To_rKey(edtFY.Text);
      adsMaster.Post;
      try
        if not adsMaster.Connection.InTransaction then
          adsMaster.Connection.BeginTrans;
        adsMaster.UpdateBatch(arAll);
      //处理子表
      //1。删除字表中所有旧的记录
      //2。重新插入字表记录
        MyDataClass.ExecSql('Delete from data0282 where eng_table_ptr='+adsMaster.fieldbyname('rkey').asstring);
        for i:=1 to StringGrid1.rowcount-1 do
          for j:=1 to StringGrid1.colcount-1 do
          begin
            adsData0282.append;
            adsData0282.Fieldbyname('Eng_table_ptr').asstring:=adsMaster.fieldbyname('rkey').asstring;
            adsData0282.Fieldbyname('Tvalue').asstring:=StringGrid1.cells[j,i];
            adsData0282.Fieldbyname('col').asinteger:=j;
            adsData0282.Fieldbyname('row_index').asinteger:=i;
          end;
        adsData0282.UpdateBatch(arAll);
        adsMaster.Connection.CommitTrans;
      except
        adsMaster.Connection.RollbackTrans;
        ShowMsg('保存数据失败，请检查!','警告',1);
        abort;
      end;
    end;
  end;
  close;
end;

procedure TfrmEdit_Data0280.Set_Run_Mode;
begin
  btnSave.Enabled := Run_Mode <> em_Browse;
  edtName.readonly := not btnSave.Enabled;
  edtDesc.readonly := not btnSave.Enabled;
  rgStatus.Enabled := btnSave.Enabled;
  comboxDatatype.Enabled := btnSave.Enabled;
  Button1.Enabled := btnSave.Enabled;
  StringGrid1.Enabled :=btnSave.Enabled;
  SpeedButton1.Enabled := btnSave.Enabled;
  spbtnX.Enabled :=btnSave.Enabled;
  spBtnY.Enabled :=btnSave.Enabled;
  spBtnCheck.Enabled :=btnSave.Enabled;
end;

function TfrmEdit_Data0280.Check_Unique_Value(KeyValue:string): boolean;
var
  Sqlstr:string;
begin
  if KeyValue = '' then //空值不能通过验证
  begin
    ShowMsg('工程表单名称不能为空，请检查!','警告',1);
    result := false;
  end
  else
  begin
    Sqlstr:='select * from data0280 where ENG_TABLE_NAME='+QuotedStr(KeyValue);
    result := not MyDataClass.IsExists(sqlstr);
//    result := adsMaster.aqTmp.IsEmpty;
    if not result then
      ShowMsg('该工程表单已经存在，不能再录入，请检查!','警告',1);
  end;
end;

procedure TfrmEdit_Data0280.FormActivate(Sender: TObject);
begin
  inherited;
  edtName.SetFocus;
end;

function TfrmEdit_Data0280.Check_Before_Post: boolean;
var
  i,J:integer;
begin
  result := true;
  if (trim(edtFy.Text)<>'') then
  begin
    if Param_Name_To_rKey(edtFy.Text)<=0 then
    begin
       ShowMsg('Y参数无效，请重新选择','提示',1);
       result := false;
       exit;
    end;
    if StrToInt(panelCol.Caption)<=2 then
    begin
      ShowMsg('当Y参数不为空时，请设置列数大于2列','提示',1);
      result := false;
      exit;
    end;
  end;
  if (trim(edtFy.Text)='') then //Y为空,列数为2列
  begin
    if StrToInt(panelCol.Caption)<>2 then
    begin
      ShowMsg('当Y参数为空时，请设置列数为2列','提示',1);
      result := false;
      exit;
    end;
  end;

  if trim(edtName.Text)='' then
  begin
    ShowMsg('请输入工程表单名称','提示',1);
    result := false;
  end
  else if Check_Date_Type(comboxDatatype.Text) = false then
  begin
    ShowMsg('无效的数据类型，请重新输入','提示',1);
    result := false;
  end
  else if rgStatus.ItemIndex=-1 then
  begin
    ShowMsg('请选择状态','提示',1);
    result := false;
  end
  else if (panelRow.Caption = '') or (panelCol.Caption='') then
  begin
    ShowMsg('请设置行和列数','提示',1);
    result := false;
  end else
  if (trim(edtFX.Text)='')  then
  begin
    ShowMsg('请设置参数X的数值','提示',1);
    result := false;
  end else
  if Param_Name_To_rKey(edtFX.Text)<=0 then
  begin
    ShowMsg('X参数无效，请重新选择','提示',1);
    result := false;
  end else
  if (StrToInt(panelRow.Caption)>0 ) or (StrToInt(panelCol.Caption)>1) then
  begin
    if StringGrid1.cells[1,1] <> '0' then
    begin
      ShowMsg('第一行,第一列为请输入"0"，该行定义参数Y的标题，不能定义参数数值','提示',1);
      result := false;
    end
    else
    for i:=1 to StringGrid1.rowcount-1 do
      for j:=1 to StringGrid1.colcount-1 do
      begin
        if StringGrid1.cells[j,i] = '' then
        begin
          ShowMsg('表格数值不能为空','提示',1);
          result := false;
          exit;
        end;
        if i = 1  then //判断第一行的数值
        begin
          if trim(edtFY.Text)='' then //没有定义Y
          begin
            if StringGrid1.cells[j,i]<>IntToStr(j-1) then
            begin
              ShowMsg('请正确定义第一行的数值，如果Y为空，那么第一行各列数值依次定义为0,1,2,3...','提示',1);
              result := false;
              exit;
            end;
          end;
        end;
      end;
  end;
end;

function TfrmEdit_Data0280.Check_Date_Type(Value: string): boolean;
begin
  result := ((trim(Value) = '数字') or (trim(value)='字符'));
end;

procedure TfrmEdit_Data0280.Button1Click(Sender: TObject);
var vrow,vcol,i:integer;
begin
  with TfrmSetRowCol.Create(Application) do
  try
    edtRow.Text:= panelRow.Caption;
    edtCol.text:= panelCol.Caption ;
    if showmodal = mrok then
    begin
      with frmMain_098 do begin
        panelRow.Caption:=edtRow.Text;
        panelCol.Caption:=edtCol.text ;
//        adsMaster.edit;
//        adsMaster.fieldbyname('row_height').asstring:=edtRow.Text;
//        adsMaster.fieldbyname('col_width').asstring:=edtCol.text;
        Stringgrid1.RowCount :=strtoint(edtRow.Text)+1;
        Stringgrid1.colCount :=strtoint(edtCol.text)+1;
        for vrow:=1 to Stringgrid1.RowCount do
        begin
          Stringgrid1.Cells[0,vrow]:=inttostr(vrow);
        end;
        for vcol:=1 to Stringgrid1.colCount do
        begin
          Stringgrid1.Cells[vcol,0]:=inttostr(vcol);
          i:=vcol;
        end;
      end;
      iFlag:=1;
    end;
  finally
    free;
  end;
  Stringgrid1.Cells[1,0]:='1 *本列为X变量';
  Stringgrid1.Cells[0,1]:='1 *本行为Y变量';
//  Stringgrid1.Cells[i,0]:=inttostr(i);
end;

procedure TfrmEdit_Data0280.FormShow(Sender: TObject);
begin
  Stringgrid1.Cells[1,0]:='1 *本列为X变量';
  Stringgrid1.Cells[0,1]:='1 *本行为Y变量';
end;

procedure TfrmEdit_Data0280.StringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  if (arow=1) or (acol=1) then
  begin
    stringgrid1.Canvas.Brush.Color := clYellow;
    stringgrid1.Canvas.FillRect(rect);
    Stringgrid1.Canvas.TextRect(rect,rect.left+2,
        rect.Top+2, trim(Stringgrid1.Cells[aCol,aRow]));
  end;
end;

procedure TfrmEdit_Data0280.StringGrid1Exit(Sender: TObject);
begin
{  try
    if comboxDatatype.ItemIndex =0 then
      if strtofloat(trim(stringgrid1.Cells[stringgrid1.Col,stringgrid1.Row]))>0 then
    else
      if  (StringGrid1.col>1) and (StringGrid1.row>1) then
        if strtofloat(trim(stringgrid1.Cells[stringgrid1.Col,stringgrid1.Row]))>0 then
  except
    Stringgrid1.SetFocus;
  end;}
end;

procedure TfrmEdit_Data0280.StringGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
//应该根据X的数据类型判断，如果是数字型，那么只能输入数字
  if xDataType = 1 then //数字型
//  if comboxDatatype.ItemIndex =0 then
  begin
    if (length(stringgrid1.Cells[StringGrid1.col,StringGrid1.row])=20) and (key<>chr(8)) then Abort;
    if (pos('.',stringgrid1.Cells[StringGrid1.col,StringGrid1.row])>0) and (key='.') then abort;
    if (pos(key,'-0123456789.')=0) and (key<>chr(8)) then
      Abort;
    if (pos('-',stringgrid1.Cells[StringGrid1.col,StringGrid1.row])>0) and (key='-') then abort;
  end;
//  comboxDatatype.Enabled :=false;
end;

procedure TfrmEdit_Data0280.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
{  try
    if comboxDatatype.ItemIndex =0 then
      if strtofloat(trim(stringgrid1.Cells[stringgrid1.Col,stringgrid1.Row]))>0 then
    else
      if  (StringGrid1.col>1) and (StringGrid1.row>1) then
        if strtofloat(trim(stringgrid1.Cells[stringgrid1.Col,stringgrid1.Row]))>0 then
  except
    canselect:=false;
  end;}
end;

procedure TfrmEdit_Data0280.btnCancelClick(Sender: TObject);
begin
  frmMain_098.adsMaster.Cancel;
  frmMain_098.adsData0282.Cancel;
end;

procedure TfrmEdit_Data0280.spBtnToExcelClick(Sender: TObject);
begin
  Export_Grid_to_Excel(StringGrid1,'ENG_TABLE');
end;

procedure TfrmEdit_Data0280.spbtnXClick(Sender: TObject);
var
  tmp_str:string;
begin
  tmp_str:= Pick_Eng_Param(0,frmMain_098.ADOConnection1,2);
  if tmp_str <> '' then
  begin
    edtFX.Text := tmp_str;
//记录X的数据类型
    xDataType:=Get_X_Data_Type(tmp_str);
  end;
end;

procedure TfrmEdit_Data0280.edtNameChange(Sender: TObject);
begin
  edtDesc.Text := trim(edtName.Text)+'('+trim(edtFX.Text)+' , '+trim(edtFy.Text)+')';
end;

procedure TfrmEdit_Data0280.spBtnYClick(Sender: TObject);
var
  tmp_str:string;
begin
  tmp_str:= Pick_Eng_Param(0,frmMain_098.ADOConnection1,2);
  if tmp_str <> '' then
    edtFY.Text := tmp_str;
end;

procedure TfrmEdit_Data0280.SpeedButton1Click(Sender: TObject);
begin
  edtFy.Text := '';
end;

procedure TfrmEdit_Data0280.edtDescChange(Sender: TObject);
begin
  if not FormInit then
    iFlag:=1;
end;

procedure TfrmEdit_Data0280.StringGrid1SetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: String);
begin
  if not FormInit then
    iFlag:=1;
end;

procedure TfrmEdit_Data0280.spBtnCheckClick(Sender: TObject);
begin
  if (trim(edtFX.Text)='')  then
  begin
    ShowMsg('请设置参数X的数值','提示',1);
    exit;
  end;
  if Param_Name_To_rKey(edtFX.Text)<=0 then
  begin
    ShowMsg('X参数无效，请重新选择','提示',1);
    exit;
  end;
  if (trim(edtFy.Text)<>'') then
  begin
    if Param_Name_To_rKey(edtFy.Text)<=0 then
    begin
       ShowMsg('Y参数无效，请重新选择','提示',1);
       exit;
    end;
  end;
  ShowMsg('参数设置正确！','提示',1);
end;

function TfrmEdit_Data0280.Get_X_Data_Type(xValue: string): byte;
var
  sqlstr:string;
begin
  sqlstr:='select Data_Type from Data0278 where PARAMETER_NAME='+QuotedStr(trim(xValue));
  result := Is_NULL(MyDataClass.Get_Sql_Value(sqlstr),0);
end;

procedure TfrmEdit_Data0280.Set_First_Row_Value;
var
  i:integer;
begin
  stringgrid1.Cells[1,1]:='0';
  if trim(edtFY.Text)='' then
  begin
    for i:=2 to StringGrid1.colcount-1 do
      stringgrid1.Cells[i,1]:=IntToStr(i-1);
  end;
end;

end.
