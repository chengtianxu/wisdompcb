unit Bom_Edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGridEh, ExtCtrls, ComCtrls, Buttons,
  StdCtrls, DBCtrls, DBGrids, Menus;

type
  TfrmBom_Edit = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel3: TPanel;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    Splitter1: TSplitter;
    Panel5: TPanel;
    btnExecBOM: TSpeedButton;
    btnGetParams: TSpeedButton;
    btnExit: TSpeedButton;
    spbtnSave: TSpeedButton;
    DBGrid1: TDBGrid;
    SpeedButton1: TSpeedButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    procedure btnGetParamsClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnExecBOMClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBGridEh1CellClick(Column: TColumnEh);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure spbtnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton2Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure DBGridEh2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    v_rkey25:integer;
    StepIncNum:integer;
    procedure LoadParams; //导入参数
    procedure InheriteParams(DrillPms:boolean); //继承参数
    procedure GenerateBOM(DATASET:TADoDataSet);//生成BOM,DATASET:存放BOM0026的DATASET
    function CalcBomPartQty(var ExprStr:string;AStepNumber: Integer):double;//计算BOM物料用量
    function Update_Expr_Param_Value(DAtaSet:TCustomADODataSet;var Exprstr:string;AStep: Integer = -1):boolean;
  public
    v_Batch_State:Boolean;//批量更新标志。默认为false，只有当在继承参数和生成BOM的时候，才为true。为的是在做批量运算的时候，相关的DataSet有些事件不需要触发。
    v_EnterMode:byte; 
    procedure Enter(EditMode:byte;rKey25:integer);
  end;

var
  frmBom_Edit: TfrmBom_Edit;

implementation
uses main_127,common,ConstVar,MyClass,ProcessShow, Dm,PickBomPart;
{$R *.dfm}

{ TfrmBom_Edit }

procedure TfrmBom_Edit.Enter(EditMode: byte; rKey25: integer);
begin
  try
    frmProcessShow := TfrmProcessShow.Create(Application);
    frmProcessShow.Show;
    StepIncNum := 100 div 10;
    frmProcessShow.IncStep(StepIncNum,'正在加载数据...');
    v_rkey25:=rkey25;
    v_EnterMode:=EditMode;
    v_Batch_State:=false;
    //1.打开所有的工序BOM材料类别资料,如果没有,则提示
    //打开BOM材料类别表
    with dmcon do begin
      frmProcessShow.IncStep(StepIncNum,'正在判断BOM资料...');
      adsMatrlGroupList.Close;
      adsMatrlGroupList.Parameters[0].Value := rKey25;
      adsMatrlGroupList.Open;
      if adsMatrlGroupList.IsEmpty then
      begin
        ShowMsg('该产品没有建立BOM资料,请注意!',1);
        abort;
      end;
      //获取参数值类别
      frmProcessShow.IncStep(StepIncNum,'正在加载参数值类别...');
      aqParamValueList.Close;
      aqParamValueList.Open;
      //打开BOM参数表497
      frmProcessShow.IncStep(StepIncNum,'正在加载BOM参数表...');
      adsBOMParams.Close;
      adsBOMParams.Parameters[0].Value := rkey25;
      adsBOMParams.Open;
    //获取所有BOM材料类别的参数
      frmProcessShow.IncStep(StepIncNum,'正在加载BOM材料类别的参数...');
      aqGroupParam.Close;
      aqGroupParam.Parameters[0].Value := v_rKey25;
      aqGroupParam.open;
      //获取工序制程参数
      frmProcessShow.IncStep(StepIncNum,'正在加载工序制程参数...');
      aqIESParams.Close;
      aqIESParams.Parameters[0].Value := v_rKey25;
      aqIESParams.open;
      //获取钻嘴表数据
      frmProcessShow.IncStep(StepIncNum,'正在加载获取钻嘴表数据...');
      aqDrillersValue.Close;
      aqDrillersValue.Parameters[0].Value := v_rKey25;
      aqDrillersValue.open;
      //获取参数表数据
      frmProcessShow.IncStep(StepIncNum,'正在加载参数表...');
      adsParamsInfo.Close;
      adsParamsInfo.Open;
      //打开BOM的材料信息表
      frmProcessShow.IncStep(StepIncNum,'正在加载BOM材料表...');
      aqBOMCalcTmp.Close;
      aqBOMCalcTmp.Parameters[0].Value := rKey25;
      aqBOMCalcTmp.Open;
      aqBOMCalcTmp.FieldByName('Mrkey').ReadOnly := false;
      aqBOMCalcTmp.FieldByName('INV_Name').ReadOnly := false;
      //打开BOM材料表0026
      frmProcessShow.IncStep(StepIncNum,'正在加载BOM材料表...');
      adsBOM.Close;
      adsBOM.Parameters[0].Value := rKey25;
      adsBOM.open;
    end;

    if EditMode = em_edit then //无BOM,要新增
    begin
     //1.导入所有BOM参数到data0497表
      if dmcon.adsProdLists.IsEmpty then
      begin
         frmProcessShow.IncStep(StepIncNum,'正在加载BOM参数...');
         LoadParams;
      end;
    end;
    dmcon.adsBOMParams.Sort:='Route_step_ptr,Seq_no ASC ';
    btnGetParams.Enabled := v_EnterMode <> em_browse;
    SpeedButton3.Enabled:=btnGetParams.Enabled;
    btnExecBOM.Enabled := v_EnterMode <> em_browse;
    DBGrid1.ReadOnly := not btnExecBOM.Enabled;
    DBGridEh1.ReadOnly:=DBGrid1.ReadOnly;
  finally
    frmProcessShow.hide;
    frmProcessShow.Free;
    frmProcessShow:= nil;
  end;
  ShowModal;
end;

procedure TfrmBom_Edit.LoadParams;
var
  Driller_Rec_NO:integer;
begin
  with dmcon do begin
    adsMatrlGroupList.DisableControls;
    try
      Driller_Rec_NO:=0;
      adsMatrlGroupList.First;
  //1.每个工序循环,
      while not adsMatrlGroupList.Eof do begin
      //2.查找每个工序的材料类别,从材料类别表的参数表499中复制参数到497表
        aqGroupParam.Filtered := false;
        aqGroupParam.Filter := 'Inv_Group_Ptr='+adsMatrlGroupList.FieldByName('INV_GROUP_PTR').AsString;
        aqGroupParam.Filtered := true;
        if adsMatrlGroupList.FieldByName('Spec_rKey').AsInteger = 1 then //该材料类别是钻嘴,那么要从钻嘴表中获取数据
        begin
          Inc(Driller_Rec_NO);
          aqDrillersValue.MoveBy(Driller_Rec_NO-aqDrillersValue.RecNo);
        end;
        while not aqGroupParam.Eof do
        begin
          if not adsBOMParams.Locate('PARAMETER_PTR',aqGroupParam.FieldByName('PARAMETER_PTR').AsString,[]) then
          begin
            adsBOMParams.Append;
            adsBOMParams.FieldByName('PARAMETER_PTR').AsString := aqGroupParam.FieldByName('PARAMETER_PTR').AsString;
            adsBOMParams.FieldByName('SEQ_NO').AsString := aqGroupParam.FieldByName('SEQ_NO').AsString;
            adsBOMParams.FieldByName('PARAMETER_VALUE').AsString := aqGroupParam.FieldByName('DEF_Value').AsString;
            adsBOMParams.Post;
          end;
          aqGroupParam.next;
        end;
        adsMatrlGroupList.Next;
      end;
    finally
      adsMatrlGroupList.first;
      adsMatrlGroupList.EnableControls;
    end;
  end;
end;

procedure TfrmBom_Edit.btnGetParamsClick(Sender: TObject);
begin
  if not MSG_Dlg_ASK('继承参数将覆盖现有参数值，继续吗？','提示',1) then exit;
  try
    v_Batch_State:=true;
    frmProcessShow := TfrmProcessShow.Create(Application);
    frmProcessShow.Show;
    StepIncNum := 100 div dmcon.adsMatrlGroupList.RecordCount;
    InheriteParams(Boolean(TComponent(Sender).Tag));
  finally
    v_Batch_State:=false;
    frmProcessShow.hide;
    frmProcessShow.Free;
    frmProcessShow:= nil;
  end;
end;

procedure TfrmBom_Edit.InheriteParams(DrillPms:boolean);
var
  Driller_Rec_NO:integer;
  bFind:boolean;
begin
  with dmcon do begin
    frmProcessShow.IncStep(StepIncNum,'正在处理各个工序材料类别参数...');
    adsMatrlGroupList.DisableControls;
    try
      DBGridEh1.DataSource:=nil; 
      Driller_Rec_NO:=0;
      if DrillPms then adsMatrlGroupList.Filter:='Spec_rKey=1';   
      adsMatrlGroupList.First;
  //1.每个工序循环,
      while not adsMatrlGroupList.Eof do begin
      //2.查找每个工序的材料类别,从材料类别表的参数表499中复制参数到497表
        frmProcessShow.IncStep(StepIncNum,'正在处理'+adsMatrlGroupList.FieldByName('DEPT_CODE').asstring+','+adsMatrlGroupList.FieldByName('BOM_NAME').asstring+'材料类别参数...');
        aqGroupParam.Filtered := false;
        aqGroupParam.Filter := 'Inv_Group_Ptr='+adsMatrlGroupList.FieldByName('INV_GROUP_PTR').AsString;
        aqGroupParam.Filtered := true;
        if adsMatrlGroupList.FieldByName('Spec_rKey').Asstring = '1' then //该材料类别是钻嘴,那么要从钻嘴表中获取数据
        begin
          Inc(Driller_Rec_NO);
          aqDrillersValue.MoveBy(Driller_Rec_NO-aqDrillersValue.RecNo);
        end;

        while not aqGroupParam.Eof do begin
          bFind:=false;
          if adsBOMParams.IsEmpty then
            bFind:= false
          else
            bFind:= adsBOMParams.Locate('SOURCE_PTR;ROUTE_STEP_PTR;PARAMETER_PTR',VarArrayOf([adsMatrlGroupList.fieldByName('MGRkey').AsString,adsMatrlGroupList.fieldByName('EFRkey').AsString,aqGroupParam.FieldByName('PARAMETER_PTR').AsString]),[loCaseInsensitive]);
          if not bFind then
          begin
            adsBOMParams.Append;
            adsBOMParams.FieldByName('PARAMETER_PTR').AsString := aqGroupParam.FieldByName('PARAMETER_PTR').AsString;
            adsBOMParams.FieldByName('SEQ_NO').AsString := aqGroupParam.FieldByName('SEQ_NO').AsString;
            adsBOMParams.FieldByName('PARAMETER_VALUE').AsString := aqGroupParam.FieldByName('DEF_Value').AsString;
           //3.如果是新增,再对每个参数查找相应的工序制程参数494,如果有,则把参数值取过来.
//            if aqIESParams.Locate('PARAMETER_PTR',VarArrayOf([aqGroupParam.FieldByName('PARAMETER_PTR').AsString]),[loCaseInsensitive]) then
//              adsBOMParams.FieldByName('PARAMETER_VALUE').AsString := aqIESParams.FieldByName('PARAMETER_VALUE').AsString;

              if aqIESParams.Locate('Parameter_ptr;step_number',VarArrayOf([aqGroupParam.FieldByName('PARAMETER_PTR').AsInteger,adsMatrlGroupList.fieldbyname('step_number').AsInteger]),[loCaseInsensitive]) then //制程参数
                adsBOMParams.FieldByName('PARAMETER_VALUE').AsString := aqIESParams.FieldByName('PARAMETER_VALUE').AsString;

            //4.如果参数是钻嘴,那么就从钻嘴表获取数值
            if uppercase(trim(adsBOMParams.FieldByName('spec_rKey').AsString)) = 'X' then //钻嘴直径
              if aqDrillersValue.RecNo <> aqDrillersValue.RecordCount then //最后一条记录说明超出了钻嘴表的范围
                if IS_Float(aqDrillersValue.FieldByName('DRILL_DIA').AsString) then
                  adsBOMParams.FieldByName('PARAMETER_VALUE').AsString := aqDrillersValue.FieldByName('DRILL_DIA').AsString;
            if uppercase(trim(adsBOMParams.FieldByName('spec_rKey').AsString)) = 'Y' then //钻嘴孔数
              if aqDrillersValue.RecNo <> aqDrillersValue.RecordCount then //最后一条记录说明超出了钻嘴表的范围
              begin
                if not (Pos('TOTAL',UpperCase(aqDrillersValue.FieldByName('unit').AsString)) > 0 ) then
                begin
                  if (trim(aqDrillersValue.FieldByName('Panel_A').AsString)<>'') and IS_Float(aqDrillersValue.FieldByName('DRILL_DIA').AsString) then
                    adsBOMParams.FieldByName('PARAMETER_VALUE').AsString := aqDrillersValue.FieldByName('Panel_A').AsString
                  else if (trim(aqDrillersValue.FieldByName('Panel_B').AsString)<>'') and IS_Float(aqDrillersValue.FieldByName('DRILL_DIA').AsString) then
                    adsBOMParams.FieldByName('PARAMETER_VALUE').AsString := aqDrillersValue.FieldByName('Panel_B').AsString ;  //B板要以新的产品编码
                end;
              end;
               // if IS_Float(aqDrillersValue.FieldByName('DRILL_DIA').AsString) then   //成本以A板的每PCS孔数为基准
                //  adsBOMParams.FieldByName('PARAMETER_VALUE').AsString := aqDrillersValue.FieldByName('Panel_A').AsString;
            adsBOMParams.Post;
          end
          else //已经存在的参数
          begin
            //修改备注：原来考虑已经存在的参数就不重新获得继承的参数值，现在改为所有参数都要重新从499获得
            begin
              adsBOMParams.edit;
              if adsBOMParams.FieldByName('SEQ_NO').IsNull then
                adsBOMParams.FieldByName('SEQ_NO').Asinteger:= aqGroupParam.FieldByName('SEQ_NO').Asinteger;
              //获得材料类别参数
              adsBOMParams.FieldByName('PARAMETER_VALUE').Asstring := aqGroupParam.FieldByName('DEF_Value').AsString;
              //如果制程参数有,则获取制程参数
              if aqIESParams.Locate('Parameter_ptr;step_number',VarArrayOf([adsBOMParams.FieldByName('PARAMETER_PTR').AsInteger,adsMatrlGroupList.fieldbyname('step_number').AsInteger]),[loCaseInsensitive]) then //制程参数
                adsBOMParams.FieldByName('PARAMETER_VALUE').AsString := aqIESParams.FieldByName('PARAMETER_VALUE').AsString;
              //如果是钻嘴,那么就从钻嘴表中取数
              if uppercase(trim(adsBOMParams.FieldByName('spec_rKey').AsString)) = 'X' then //钻嘴直径
                if aqDrillersValue.RecNo <> aqDrillersValue.RecordCount then //最后一条记录说明超出了钻嘴表的范围
                  if IS_Float(aqDrillersValue.FieldByName('DRILL_DIA').AsString) then
                    adsBOMParams.FieldByName('PARAMETER_VALUE').AsString := aqDrillersValue.FieldByName('DRILL_DIA').AsString;
              if uppercase(trim(adsBOMParams.FieldByName('spec_rKey').AsString)) = 'Y' then //钻嘴孔数
                if aqDrillersValue.RecNo <> aqDrillersValue.RecordCount then //最后一条记录说明超出了钻嘴表的范围
                begin
                  if not (Pos('TOTAL',UpperCase(aqDrillersValue.FieldByName('unit').AsString)) >0 ) then
                  begin
                    if (trim(aqDrillersValue.FieldByName('Panel_A').AsString)<>'') and IS_Float(aqDrillersValue.FieldByName('DRILL_DIA').AsString) then
                      adsBOMParams.FieldByName('PARAMETER_VALUE').AsString := aqDrillersValue.FieldByName('Panel_A').AsString
                    else if (trim(aqDrillersValue.FieldByName('Panel_B').AsString)<>'') and IS_Float(aqDrillersValue.FieldByName('DRILL_DIA').AsString) then
                      adsBOMParams.FieldByName('PARAMETER_VALUE').AsString := aqDrillersValue.FieldByName('Panel_B').AsString ;
                  end;
                end;
              adsBOMParams.Post;
            end ;
          end;
          aqGroupParam.next;
        end;
        adsMatrlGroupList.Next;
      end;
    finally
      adsMatrlGroupList.Filter:='';
      aqGroupParam.Filter := '';
      aqGroupParam.Filtered := false;
      DBGridEh1.DataSource:=dsBOMParams;
      adsMatrlGroupList.first;
      adsMatrlGroupList.EnableControls;
    end;
  end;
end;

procedure TfrmBom_Edit.btnExitClick(Sender: TObject);
begin
  if dmcon.adsBOM.State in dsEditModes then
    dmcon.adsBOM.Cancel;
  close;
end;

procedure TfrmBom_Edit.btnExecBOMClick(Sender: TObject);
begin
  try
    frmProcessShow := TfrmProcessShow.Create(Application);
    frmProcessShow.Show;
    StepIncNum := 100 div (dmcon.adsMatrlGroupList.RecordCount+3);

    v_Batch_State:=true;
    dmcon.aqEngTable.Close;
    dmcon.aqEngTable.Open;
  //全局参数
    dmcon.aqPubParams.Close;
    dmcon.aqPubParams.Parameters[0].Value := v_rKey25;
    dmcon.aqPubParams.Open;
    dmcon.aqGroupParam.Filter := '';
    dmcon.aqGroupParam.Filtered := false;
    spbtnSave.Enabled:=true;
    GenerateBOM(dmcon.adsBOM);
  finally
    v_Batch_State:=false;
    frmProcessShow.hide;
    frmProcessShow.Free;
    frmProcessShow:= nil;
    if not dmcon.adsBOM.IsEmpty then
    begin
      dmcon.adsBOM.Edit;//为了触发显示计算字段
      dmcon.adsBOM.Post;
    end;
    PageControl1.ActivePageIndex :=1;
  end;
end;

procedure TfrmBom_Edit.GenerateBOM(DATASET:TADoDataSet);
var
  sqlstr,subSql,ExprStr,F01,F02,F03:string;
  RecNO,istep:integer;
begin
//方法:
//清空0026表,
  frmProcessShow.IncStep(StepIncNum,'正在查找工序材料...');
  MyDataClass.DeleteTable(DataSet);

//1.循环工序,
//3.并计算每款材料用量
  with dmcon do begin
    adsMatrlGroupList.DisableControls;
    adsBOMParams.DisableControls;
    try
  //1.每个工序循环,
      try
        adsMatrlGroupList.First;
        istep:=1;
        while not adsMatrlGroupList.Eof do
        begin
          if trim(adsMatrlGroupList.fieldbyName('FORMULA').Asstring)='' then
          begin
            showmessage(inttostr(istep)+'步骤：'+#13+'材料用料公式不能为空,请检查...');
            abort;
          end;

          frmProcessShow.IncStep(StepIncNum,'正在处理工序'+adsMatrlGroupList.fieldByName('INV_GROUP_PTR').Asstring+'...');

          //2.根据每个工序设置的参数,到材料表0017中定位每款材料,
          adsBOMParams.First;
          RecNO:=0;
          Sqlstr:='select rkey,inv_part_number from data0017 where group_ptr='+QuotedStr(adsMatrlGroupList.fieldByName('INV_GROUP_PTR').Asstring);
          //循环BOM的参数
          subSql:='';
          while not adsBOMParams.eof do
          begin
           if trim(adsBOMParams.FieldByName('parameter_value').AsString) <> '' then
            begin
              if aqGroupParam.Locate('INV_Group_ptr;SEQ_NO;Parameter_Ptr',varArrayOf([adsMatrlGroupList.FieldByName('INV_GROUP_PTR').value,adsBOMParams.FieldByName('Seq_no').value,adsBOMParams.FieldByName('Parameter_Ptr').value]),[loCaseInsensitive]) then
              begin
                if aqGroupParam.FieldByName('ttype').Asinteger= 0 then //0材料参数,1产品参数
                begin
                  inc(RecNo);
                  Subsql:= Subsql + ' and ies_parameter_value'+IntToStr(RecNo)+'='+QuotedStr(trim(adsBOMParams.FieldByName('parameter_value').AsString));
                end;
              end;
            end;
            adsBOMParams.Next;
          end;

          if (adsMatrlGroupListrequired.Value='Y') and (SubSql='') then
          begin
            showmessage(inttostr(istep)+'步骤必须有材料,参数值不能为空...');
            abort;
          end;

          if SubSql <>'' then
          begin
            aqMaterials.close;
            aqMaterials.SQL.Clear;
            aqMaterials.SQL.Add(sqlstr+SubSql);

            try
            aqMaterials.open;
            except
              showmessage(inttostr(istep)+'步骤'+'-'+inttostr(RecNo)+'参数值错误'+#13+sqlstr+SubSql);
              abort;
            end;
            //0017查找材料
            if aqMaterials.IsEmpty then
            begin
              ShowMsg(trim(adsMatrlGroupList.fieldbyName('Dept_Code').AsString)+'-'+trim(adsMatrlGroupList.fieldbyName('BOM_NAME').AsString)+ ' 没有找到匹配的材料,请检查各参数值!',1);
              abort;
            end
            else if aqMaterials.RecordCount > 1 then
            begin
              ShowMsg('适合 '+trim(adsMatrlGroupList.fieldbyName('Dept_Code').AsString)+'-'+trim(adsMatrlGroupList.fieldbyName('BOM_NAME').AsString)+ ' 的材料不止一项,请检查!',1);
              abort;
            end
            else
            begin
              DataSet.Append;
              DataSet.FieldByName('Manu_BOM_Ptr').Value := v_rKey25;
              DataSet.FieldByName('Dept_Ptr').Value := adsMatrlGroupList.fieldbyName('rKey').value;
              DataSet.FieldByName('Inventory_Ptr').Value := aqMaterials.fieldbyName('rKey').value;
              DataSet.FieldByName('Route_Step_No').Value := adsMatrlGroupList.fieldbyName('STEP_NUMBER').value;
              DataSet.FieldByName('Doc_Flag').Value := adsMatrlGroupList.fieldbyName('Doc_Flag').value;
              frmProcessShow.IncStep(StepIncNum,'正在计算BOM材料用量...');
              ExprStr:=' '+trim(adsMatrlGroupList.fieldbyName('FORMULA').Asstring)+' ';
              try
                try
//                  aqIESParams.Filter := 'step_number=' + adsMatrlGroupList.fieldbyname('step_number').AsString;
//                  aqIESParams.Filtered := True;
                  DataSet.FieldByName('Qty_Bom').Value := CalcBomPartQty(ExprStr,adsMatrlGroupList.fieldbyname('step_number').AsInteger);
                finally
                  //aqIESParams.Filtered := False;
                end;
              except
                ShowMsg(inttostr(istep)+'步骤用量公式计算错误:'+trim(adsMatrlGroupList.fieldbyName('FORMULA').Asstring),1);
                abort;
              end;
              DataSet.Post;
            end;
          end;
          adsMatrlGroupList.Next;
          inc(istep);
        end;
      except
        try
          if DataSet.RecordCount > 0 then DataSet.CancelBatch(arAll);
        except
        end;
        if spbtnSave.Enabled then  spbtnSave.Enabled:= false;
        ShowMsg('生成BOM失败!',1);
      end;
    finally
      adsMatrlGroupList.first;
      adsMatrlGroupList.EnableControls;
      adsBOMParams.EnableControls;
    end;
  end;
end;

function TfrmBom_Edit.CalcBomPartQty(var ExprStr:string;AStepNumber: Integer): double;
var
  i,j:integer;
  X,Y:string;
  rkey,s_Y,s_X,d_Y,d_X:String;
  x_DataType,y_DataType:byte;
  TmpDataSet:TAdoDataSet;
  rslt_value:variant;
  Tmpstr:string;
begin
//工程表单
  with dmcon do begin
    Tmpstr:=ExprStr;
    //从公式中替换掉BOM,PD字符，便于计算公式.
    ExprStr:= StringReplace(ExprStr,' BOM.',' ',[rfReplaceAll]);
    ExprStr:= StringReplace(ExprStr,' PD.',' ',[rfReplaceAll]);
    try
      TmpDataSet:= TADoDataSet.Create(self);
      TmpDataSet.LockType := ltBatchOptimistic;
      TmpDataSet.Clone(adsParamsInfo);
    //1.处理公式中的工程表单,
      aqEngTable.First;
      while not aqEngTable.Eof do
      begin
        i:= Pos(' '+trim(aqEngTable.fieldbyName('FXY').AsString)+' ',ExprStr);
        if i > 0 then //在公式中找到了工程表单
        begin
          rKey:= aqEngTable.fieldbyName('rKey').AsString;
//          if rkey = '79' then
//          begin
//            aqIESParams.First;
//            while not aqIESParams.Eof do
//            begin
//              ShowMessage(aqIESParams.FieldByName('Parameter_ptr').AsString +'   ' + aqIESParams.FieldByName('Parameter_value').AsString);
//              aqIESParams.Next;
//            end;
//
//if aqIESParams.Locate('Parameter_ptr',581,[loCaseInsensitive]) then //制程参数
//ShowMessage(aqIESParams.FieldByName('Parameter_ptr').AsString +'   ' + aqIESParams.FieldByName('Parameter_value').AsString);
//
//            Sleep(1);
//          end;
          x:= aqEngTable.fieldbyName('FX').AsString;
          y:= aqEngTable.fieldbyName('FY').AsString;
          s_x:='';s_y:='';d_x:='1';d_y:='1';
          if x <> '' then
          begin
            if TmpDataSet.Locate('rKey',x,[loCaseInsensitive]) then
              x_DataType:= TmpDataSet.fieldByName('Data_Type').AsInteger
            else
            begin
              ShowMsg('没有找到工程表单:'+trim(aqEngTable.fieldbyName('FXY').AsString)+'的X参数类型值',1);
              abort;
            end;
            if aqPubParams.Locate('Parameter_ptr',x,[loCaseInsensitive]) then  //全局参数
              s_x:= aqPubParams.FieldByName('Parameter_value').AsString
            else if adsBOMParams.Locate('Parameter_ptr',x,[loCaseInsensitive]) then //材料参数
              s_x:= adsBOMParams.FieldByName('Parameter_value').AsString
            else if aqIESParams.Locate('Parameter_ptr;step_number',VarArrayOf([x,AStepNumber]),[loCaseInsensitive]) then //制程参数
              s_x:= aqIESParams.FieldByName('Parameter_value').AsString
            else begin
               dmcon.tmp1.Close;
               dmcon.tmp1.SQL.Text:='select parameter_name+'' ''+parameter_desc from data0278 where rkey='+x;
               dmcon.tmp1.Open;
               ShowMsg('错误工程参数:'+trim(dmcon.tmp1.fields[0].AsString)+'在本产品中不存在',1);
               dmcon.tmp1.Close;
               abort;
            end;
            if trim(s_x) = '' then
            begin
              ShowMsg(trim(aqIESParams.fieldbyName('Parameter_Name').AsString)+'参数没有赋值',1);
              abort;
            end;
            if x_DataType= 1 then //数字
            begin
              d_x:=s_x;
              s_x:='';
            end;
          end;
          if y <> '' then
          begin
            if TmpDataSet.Locate('rKey',y,[loCaseInsensitive]) then
              y_DataType:= TmpDataSet.fieldByName('Data_Type').AsInteger
            else
            begin
              ShowMsg('没有找到工程表单:'+trim(aqEngTable.fieldbyName('Eng_Table_Desc').AsString)+'的y参数类型值',1);
              abort;
            end;
            if aqPubParams.Locate('Parameter_ptr',y,[loCaseInsensitive]) then  //全局参数
              s_y:= aqPubParams.FieldByName('Parameter_value').AsString
            else if aqIESParams.Locate('Parameter_ptr',y,[loCaseInsensitive]) then //制程参数
              s_y:= aqIESParams.FieldByName('Parameter_value').AsString
            else if adsBOMParams.Locate('Parameter_ptr',y,[loCaseInsensitive]) then //BOM参数
              s_y:= adsBOMParams.FieldByName('Parameter_value').AsString
            else begin
               dmcon.tmp1.Close;
               dmcon.tmp1.SQL.Text:='select parameter_name+'' ''+parameter_desc from data0278 where rkey='+y;
               dmcon.tmp1.Open;
               ShowMsg('错误工程参数:'+trim(dmcon.tmp1.fields[0].AsString)+'在本产品中不存在',1);
               dmcon.tmp1.Close;
               abort;
            end;
            if trim(s_y) = '' then
            begin
              ShowMsg(trim(aqIESParams.fieldbyName('Parameter_Name').AsString)+'参数没有赋值',1);
              abort;
            end;
            if y_DataType= 1 then //数字
            begin
              d_y:=s_y;
              s_y:='';
            end;
          end;

          rslt_value:=Calc_Eng_Table(rKey,s_x,s_y,d_x,d_y);//计算并返回工程表单的值

        //  rslt_value:=MyDataClass.Get_Sql_Value('Exec WZPR085 ' + rKey + ',' + QuotedStr(s_x) + ',' + QuotedStr(s_y) + ',' + d_x + ',' + d_y;);

          if rslt_value = NULL then
          begin
            ShowMsg('计算异常：没有取到工程表单对应的数值。'+trim(aqEngTable.fieldbyName('FXY').AsString),1);
            abort;
          end;

          if aqEngTable.FieldByName('data_type').AsInteger=1 then//数字型
            ExprStr:= StringReplace(ExprStr,' '+trim(aqEngTable.fieldbyName('FXY').AsString)+' ',rslt_value,[rfReplaceAll])
          else
            ExprStr:= StringReplace(ExprStr,' '+trim(aqEngTable.fieldbyName('FXY').AsString)+' ',QuotedStr(rslt_value),[rfReplaceAll])
        end;
        aqEngTable.next;
      end;

  //4.处理全局参数
      Update_Expr_Param_Value(aqPubParams,ExprStr,-1);
  //3.处理材料 参数
      Update_Expr_Param_Value(adsBOMParams,ExprStr,-1);
  //2.处理制程参数
      Update_Expr_Param_Value(aqIESParams,ExprStr,AStepNumber);
  //5.计算公式
      if not Calc_Expr_Parma(ExprStr,adsMatrlGroupList.Connection,result) then
      begin
        ShowMsg('计算出错,公式:'+tmpstr+#13+#10+',赋值后:'+ExprStr,1);
        abort;
      end;
    finally
      TmpDataSet.Close;
      TmpDataSet.free;
    end;
  end;
end;

function TfrmBom_Edit.Update_Expr_Param_Value(DAtaSet:TCustomADODataSet;var Exprstr:string;AStep: Integer = -1):boolean;
begin
  DAtaSet.first;
  while not DAtaSet.eof do
  begin
    if Pos(' '+trim(DAtaSet.fieldbyName('Parameter_name').AsString)+' ',ExprStr) > 0 then
    begin
      if AStep <> - 1 then
      begin
        if DAtaSet.FieldByName('step_number').AsInteger <> AStep then
        begin
          DAtaSet.next;
          Continue;
        end;
      end;
      if trim(DAtaSet.fieldbyName('Parameter_value').AsString)='' then
      begin
        if DAtaSet.fieldbyName('Data_Type').AsInteger = 1 then //数字
          ExprStr:= StringReplace(ExprStr,' '+trim(DAtaSet.fieldbyName('Parameter_name').AsString)+' ',' '+'0'+' ',[rfReplaceAll])
        else
          ExprStr:= StringReplace(ExprStr,' '+trim(DAtaSet.fieldbyName('Parameter_name').AsString)+' ',' '+QuotedStr('')+' ',[rfReplaceAll]);
      end;

       if DAtaSet.fieldbyName('Data_Type').AsInteger = 1 then //数字
         ExprStr:= StringReplace(ExprStr,' '+trim(DAtaSet.fieldbyName('Parameter_name').AsString)+' ',' '+trim(DAtaSet.FieldByName('Parameter_value').AsString)+' ',[rfReplaceAll])
       else
         ExprStr:= StringReplace(ExprStr,' '+trim(DAtaSet.fieldbyName('Parameter_name').AsString)+' ',' '''+trim(DAtaSet.FieldByName('Parameter_value').AsString)+''' ',[rfReplaceAll]);
      // break;
    end;
    DAtaSet.next;
  end;
end;

procedure TfrmBom_Edit.SpeedButton1Click(Sender: TObject);
begin
  Export_dbGrid_to_Excel(dbGrid1,'计算')
end;

procedure TfrmBom_Edit.DBGridEh1CellClick(Column: TColumnEh);
var
  sDataType:string;
begin
  if Column.Index <> 5 then DBGridEh1.SelectedIndex := 5; //Column. .Index :=5;
{  aqParamValueList.Filtered := false;
  aqParamValueList.Filter := 'parameter_ptr='+adsBOMParams.fieldByName('parameter_ptr').AsString;
  aqParamValueList.Filtered := true;
  DBGridEh1.Columns[5].PickList.clear;
  aqParamValueList.first;
  while not aqParamValueList.Eof do begin
    DBGridEh1.Columns[5].PickList.Add(trim(aqParamValueList.FieldByName('TValue').AsString));
    aqParamValueList.next;
  end;}
end;

procedure TfrmBom_Edit.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssCtrl in Shift) and (Key = VK_DELETE) then
    abort;
  if Key = VK_Insert then
    abort;
  if Key=VK_DOWN then
  begin
    Key:=0;
    TDBGridEH(Sender).DataSource.DataSet.Next
  end
end;

procedure TfrmBom_Edit.spbtnSaveClick(Sender: TObject);
begin
  //是否三个月内没有发放则提示
  dmcon.adsBOM.DisableControls;
  try
    dmcon.adsBOM.First;
    while not dmcon.adsBOM.Eof do
    begin
      if dmcon.adsBOM.FieldByName('INVENTORY_PTR').AsInteger <> 0 then
      begin
        dmcon.tmp.Close;
        dmcon.tmp.SQL.Clear;
        dmcon.tmp.SQL.Add('select 1 from data0207 where INVENTORY_PTR = '+ dmcon.adsBOM.FieldByName('INVENTORY_PTR').AsString );
        dmcon.tmp.SQL.Add(' and TDATE > (getdate() - 92)');
        dmcon.tmp.Open;
        if dmcon.tmp.IsEmpty then
        begin
          ShowMessage('提示:  材料 ' + dmcon.adsBOM.fieldbyname('PartName').AsString + ' 进三个月内无 材料发放记录');
        end;
      end;
      dmcon.adsBOM.Next;
    end;
  finally
    dmcon.adsBOM.EnableControls;
  end;

  if not dmcon.SaveData then
    ShowMsg('保存BOM数据失败!',1);
  close;
end;

procedure TfrmBom_Edit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmBom_Edit:= nil;
end;

procedure TfrmBom_Edit.N1Click(Sender: TObject);
begin
  with TfrmPickBOMPart.Create(Application)do
  try
    Enter('',v_rkey25);
//    ComboBox1.ItemIndex:= ComboBox1.Items.IndexOf(trim(dmcon.adsBOM.FieldByName('DEPT_Code').Asstring));
    if Showmodal = mrok then
    begin
      dmcon.adsBOM.Append;
      spbtnSave.Enabled:= true;
      dmcon.adsBOM.FieldByName('INVENTORY_PTR').Value :=edtPartNo.Tag;
      dmcon.adsBOM.FieldByName('QTY_BOM').Value :=edtQty.Text;
      if adsRoute.Locate('DEPT_CODE',ComboBox1.Text,[loCaseInsensitive]) then
      begin
        dmcon.adsBOM.FieldByName('DEPT_PTR').Value :=adsRoute.FieldByName('rKey').AsString;
        dmcon.adsBOM.FieldByName('Route_Step_No').Value :=adsRoute.fieldbyName('Step_Number').value;
        if CheckBox1.Checked then
          dmcon.adsBOM.FieldByName('Doc_Flag').Value :='Y'
        else
          dmcon.adsBOM.FieldByName('Doc_Flag').Value :='N';
        dmcon.adsBOM.FieldByName('Manu_BOM_Ptr').Value := v_rKey25;
      end;
    end;
  finally
    free;
    N2.Enabled:=not DBGrid1.DataSource.DataSet.IsEmpty;
    N3.Enabled:=N2.Enabled;
  end;
end;

procedure TfrmBom_Edit.N3Click(Sender: TObject);
begin
  with TfrmPickBOMPart.Create(Application)do
  try
    Enter(dmcon.adsBOM.FieldByName('PartNo').Value,-1);
    labelroute.Caption := '工序:'+dmcon.adsBOM.FieldByName('DeptName').Asstring+'      步骤:'+ dmcon.adsBOM.FieldByName('ROUTE_STEP_NO').Asstring;
    CheckBox1.Checked := dmcon.adsBOM.FieldByName('Doc_Flag').Value ='Y';
    edtQty.text := dmcon.adsBOM.FieldByName('QTY_BOM').Asstring;
    if Showmodal = mrok then
    begin
      if not adsPart.IsEmpty then
      begin
        if not dmcon.adsBOM.IsEmpty then
        begin
          dmcon.adsBOM.edit;
          spbtnSave.Enabled:= true;
          dmcon.adsBOM.FieldByName('INVENTORY_PTR').Value :=edtPartNo.Tag;
          dmcon.adsBOM.FieldByName('QTY_BOM').Value :=edtQty.Text;
          if CheckBox1.Checked then
            dmcon.adsBOM.FieldByName('Doc_Flag').Value :='Y'
          else
            dmcon.adsBOM.FieldByName('Doc_Flag').Value :='N';
        end;
      end;
    end;
  finally
    free;
  end;
end;

procedure TfrmBom_Edit.N2Click(Sender: TObject);
begin
  if Msg_Dlg_Ask('确定删除吗?','提示',1) then
  begin
    dmcon.adsBOM.Delete;
    spbtnSave.Enabled:= true;
    N2.Enabled:=not DBGrid1.DataSource.DataSet.IsEmpty;
    N3.Enabled:=N2.Enabled;
  end
end;

procedure TfrmBom_Edit.PopupMenu1Popup(Sender: TObject);
begin
  if dmcon.Ftag = 5 then abort;
end;

procedure TfrmBom_Edit.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ([ssShift, ssAlt]=Shift) and (key=83) then
    showmessage(dmcon.adsBOM.CommandText)

  else if (ssCtrl in Shift) and (Key = VK_DELETE) then
    abort;
  if Key = VK_Insert then
    abort;
  if Key=VK_DOWN then
  begin
    Key:=0;
    TDBGrid(Sender).DataSource.DataSet.Next
  end
end;

procedure TfrmBom_Edit.SpeedButton2Click(Sender: TObject);
var
  filter:string;
begin
  try
    dmcon.adsBOMParams.DisableControls;
    dmcon.adsBOMParams.Filtered:=false;
    if dmcon.adsBOMParams.State in dsEditModes then
      dmcon.adsBOMParams.Post;
    dmcon.adsBOMParams.UpdateBatch(arAll);
    dmcon.adsBOMParams.Filtered:=true;
    dmcon.adsBOMParams.EnableControls;
  except
    dmcon.adsBOMParams.Filtered:=true;
    dmcon.adsBOMParams.EnableControls;
    ShowMsg('保存参数失败,请检查!',1);
  end;
end;

procedure TfrmBom_Edit.PageControl1Change(Sender: TObject);
begin
  N2.Enabled:=not DBGrid1.DataSource.DataSet.IsEmpty;
  N3.Enabled:=N2.Enabled;
end;

procedure TfrmBom_Edit.DBGridEh2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if dmcon.adsMatrlGroupListrequired.Value='Y' then   //必选材料
    DBGridEh2.Canvas.Font.Color:=Clred;
  DBGridEh2.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TfrmBom_Edit.DBGridEh2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ([ssShift, ssAlt]=Shift) and (key=83) then
    showmessage(dmcon.adsMatrlGroupList.CommandText);
end;

procedure TfrmBom_Edit.FormShow(Sender: TObject);
begin
  if dmcon.FTag=5 then
  begin
    btnGetParams.Enabled:=false;
    SpeedButton3.Enabled:=false;
    SpeedButton2.Enabled:=false;
    btnExecBOM.Enabled:=false;
    spbtnSave.Enabled:=false;
  end;
end;

end.
