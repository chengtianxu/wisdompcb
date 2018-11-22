unit formFind;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,  DB, ADODB,  DBGridEh, StdCtrls, Buttons,
  ExtCtrls, Grids;

type
  TQueryInfo=class
  private
  protected
  public
    L_ListDataSetName  :TDataSet;          //下拉列表数据集名
    L_AddItem          :array of string;   //
    L_DropdownField    :string;            //添加下拉列表的字段名
    L_ListResultField  :string;            //下拉列表数据集返回的字段名     AnsiString
  end;

type
  TfrmFind = class(TForm)
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    DBGridEh1: TDBGridEh;
    ListBox1: TListBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ADOQuery1FieldCaption: TWideStringField;
    ADOQuery1Condvalu: TStringField;
    ADOQuery1Condvalu2: TStringField;
    ADOQuery1FieldDataType: TStringField;
    ADOQuery1Oper: TStringField;
    ADOQuery1FieldKind: TWordField;
    ADOQuery1FieldName: TStringField;
    procedure Button1Click(Sender: TObject);
    procedure ADOQuery1CondvaluSetText(Sender: TField; const Text: string);
    procedure Button2Click(Sender: TObject);
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure DBGridEh1Columns4EditButtonClick(Sender: TObject;
      var Handled: Boolean);
    procedure ADOQuery1Condvalu2SetText(Sender: TField;
      const Text: String);
  private
    
    { Private declarations }
  public
    
    strWhere:string;
    procedure Init   ;
    { Public declarations }
  end;
                     //AHandle,IconHandle:THandle;
Function ShowfrmFind(AOwnerForm:TForm;const ADODataSet:TDataSet;out vStrWhere:string;
        const NotDisplayFields:String='';const DisplayFields: String='';
        const F_h:Integer=0;const F_w:Integer=0):Boolean;StdCall;


var
  frmFind: TfrmFind;
  Query_Info:array of TQueryInfo;
implementation

uses   SelectItemUnit, damo;

{$R *.dfm}
                      // AHandle,IconHandle:THandle;
Function ShowfrmFind(AOwnerForm:TForm;const ADODataSet:TDataSet;out vStrWhere:string;
        const NotDisplayFields:String='';const DisplayFields: String='';
        const F_h:Integer=0;const F_w:Integer=0):Boolean;
var
  I:Integer;
begin
  Result:=False;
  try
    if Assigned (frmFind)=False then
    with frmFind     do
    begin
  //    Application.Handle:=AOwnerForm.Handle; //
  //    Application.Icon.Handle:= IconHandle;
      //frmQuery.Icon.Handle:=IconHandle;
      frmFind:=TfrmFind.Create(Application);
      Font.Size:= AOwnerForm.Font.Size;
      Font.Charset:= AOwnerForm.Font.Charset;
      Font.Name:= AOwnerForm.Font.Name;
      ADOQuery1.Connection:= (ADODataSet as TCustomADODataSet).Connection    ;
    end;

    if frmFind.ADOQuery1.Active then
    frmFind.ADOQuery1.Close;
    frmFind.ADOQuery1.Open;
    for i:=0 to   ADODataSet.FieldCount-1 do
    begin
      if DisplayFields<>'' then
      begin
        if Pos(UpperCase(ADODataSet.Fields[i].FieldName),UpperCase(DisplayFields))>0 then
        begin
          with frmFind.ADOQuery1 do
          begin
            Append;
            FieldByName('FieldCaption').Value:= ADODataSet.Fields[i].DisplayLabel;
            FieldByName('FieldName').Value:= ADODataSet.Fields[i].FieldName;
            FieldByName('FieldDataType').Value:= ADODataSet.Fields[i].FieldName;
            with ADODataSet.Fields[i] do
            begin
              if  DataType in [ftString,ftWideString] then
              begin
                FieldByName('FieldDataType').Value:='ftString'  ;
                FieldByName('Oper').Value :='≈';
              end
              else
              if  DataType in [ftBCD,ftFloat,ftCurrency,ftLargeint,ftSmallint,ftInteger,ftWord] then
              begin
                FieldByName('FieldDataType').Value:='ftBCD' ;
                FieldByName('Oper').Value :='=';
              end
              else
              if  DataType in [ftDate,ftDateTime] then
              begin
                FieldByName('FieldDataType').Value:='ftDate';
                FieldByName('Oper').Value :='=';
              end;

              if FieldKind= fkData then           //   如果是LOOKUP字段
                FieldByName('FieldKind').Value:=0
              else
              if FieldKind= fkLookup then           //   如果是LOOKUP字段
                FieldByName('FieldKind').Value:=1
              else
              if FieldKind= fkCalculated then       //  如果是计算字段
                FieldByName('FieldKind').Value:=2;
            end;
            Post;
          end;
        end;
      end
      else
      if Pos(UpperCase(ADODataSet.Fields[i].FieldName),UpperCase(NotDisplayFields))<=0 then      //只有找不到的时候，才要添加
      begin
        with frmFind.ADOQuery1 do
        begin
          Append;
          FieldByName('FieldCaption').Value:= ADODataSet.Fields[i].DisplayLabel;
          FieldByName('FieldName').Value:= ADODataSet.Fields[i].FieldName;
          FieldByName('FieldDataType').Value:= ADODataSet.Fields[i].FieldName;
          with ADODataSet.Fields[i] do
          begin
            if  DataType in [ftString] then
            begin
              FieldByName('FieldDataType').Value:='ftString'  ;
              FieldByName('Oper').Value :='≈';
            end
            else
            if  DataType in [ftBCD,ftFloat,ftCurrency,ftLargeint,ftSmallint,ftInteger,ftWord] then
            begin
              FieldByName('FieldDataType').Value:='ftBCD' ;
              FieldByName('Oper').Value :='=';
            end
            else
            if  DataType in [ftDate,ftDateTime] then
            begin
              FieldByName('FieldDataType').Value:='ftDate';
              FieldByName('Oper').Value :='=';
            end;

            if FieldKind= fkData then           //   如果是LOOKUP字段
              FieldByName('FieldKind').Value:=0
            else
            if FieldKind= fkLookup then           //   如果是LOOKUP字段
              FieldByName('FieldKind').Value:=1
            else
            if FieldKind= fkCalculated then       //  如果是计算字段
              FieldByName('FieldKind').Value:=2;
          end;
          Post;
        end;
      end;
    end;

    with   frmFind do
    begin
      if  F_w>0 then
      Width:=F_w;
      if F_h>0 then
      Height:=F_h;

      frmFind.Init;
      if ShowModal=mrOk then
      begin
        if  StrWhere='' then
        StrWhere:=' 1=1';
        vStrWhere:=StrWhere;
        Result:=True;
      end;
    end;
  finally
    //frmQuery.Free;
  end;
end;

procedure TfrmFind.DBGridEh1Columns4EditButtonClick(Sender: TObject;
  var Handled: Boolean);
var
  i         :Integer;
  L,T,W,X,H :Integer;
  Vpoint    :Tpoint;
begin
  Vpoint   := (Sender as TControl).Parent.ClientToScreen(Point((Sender as TControl).Left,(Sender as TControl).Top));
  t:= Vpoint.y+(Sender as TControl).Height;
  w:=400;
  H:=240;
  x:=Screen.Width- Vpoint.X-w- (Sender as TControl).Parent.Width;
  if x<0 then
    L:=Screen.Width -w- (Sender as TControl).Parent.Width
  else
    L:= Vpoint.X- (Sender as TControl).Parent.Width;
   //屏幕的高度-控件按钮所在的高度  小于弹出窗口的高度
  if  (Screen.Height-t)<   h then
  t:=Screen.Height-h;
  for i:=0 to High(Query_Info) do
  if  UpperCase(ADOQuery1.FieldByName('FieldName').Value) = UpperCase(Query_Info[i].L_DropdownField) then
  if Query_Info[i].L_ListDataSetName<>nil then
  begin
    if ShowAddListForm(Self,Query_Info[i].L_ListDataSetName,Query_Info[i].L_ListResultField,
              Trim(ADOQuery1.FieldByName('Condvalu').AsString),
              L,T,w) then   //
    begin
      if  ADOQuery1.State <>dsEdit then
         ADOQuery1.Edit;
      ADOQuery1.FieldByName('Condvalu').Value:=
          Trim(Query_Info[i].L_ListDataSetName.FieldByName(Query_Info[i].L_ListResultField).Value);
      ADOQuery1.FieldByName('Oper').Value :='=';     //如果用户是从列表中选取一行记录，操作符改为“=”号
      if Query_Info[i].L_ListDataSetName.Filtered then
      Query_Info[i].L_ListDataSetName.Filtered :=False;
    end  ;
  end
end;

procedure TfrmFind.FormCreate(Sender: TObject);
begin
//  SetLength(Query_Info,7);
//  Query_Info[0]:=TQueryInfo.Create();
//  with Query_Info[0] do
//  begin
//    L_ListDataSetName       :=DM.cds0005;
//    L_DropdownField        :='雇员';   //雇员代码
//    L_ListResultField       :='EMPLOYEE_NAME';
//  end;
//  Query_Info[1]:=TQueryInfo.Create();
//  with Query_Info[1] do
//  begin
//    L_ListDataSetName       :=DM.AQ0034;
//    L_DropdownField        :='部门名称';   //雇员代码
//    L_ListResultField       :='DEPT_NAME';
//  end;
//  Query_Info[2]:=TQueryInfo.Create();
//  with Query_Info[2] do
//  begin
//    L_ListDataSetName       :=DM.cds0005;
//    L_DropdownField        :='受理人';   //雇员代码
//    L_ListResultField       :='EMPLOYEE_NAME';
//  end;
//  Query_Info[3]:=TQueryInfo.Create();
//  with Query_Info[3] do
//  begin
//    L_ListDataSetName       :=DM.cds0005;
//    L_DropdownField        :='完工人员';   //雇员代码
//    L_ListResultField       :='EMPLOYEE_NAME';
//  end;
//  Query_Info[4]:=TQueryInfo.Create();
//  with Query_Info[4] do
//  begin
//    L_AddItem:=varArrayOF(['未提交','待受理','已受理','已完工','已验收','被退回','已暂停','验收退回']);
//   // L_ListDataSetName       :=DM.cds832;
//    L_DropdownField        :='工作单状态';   //雇员代码
//   // L_ListResultField       :='MainexecStat';
//  end;
//  Query_Info[5]:=TQueryInfo.Create();
//  with Query_Info[5] do
//  begin
//    L_ListDataSetName       :=DM.aq0015;
//    L_DropdownField        :='工厂';   //雇员代码
//    L_ListResultField       :='abbr_name';
//  end;
//  Query_Info[6]:=TQueryInfo.Create();
//  with Query_Info[6] do
//  begin
//    L_ListDataSetName       :=DM.cds0005;
//    L_DropdownField        :='输入人员';   //雇员代码
//    L_ListResultField       :='EMPLOYEE_NAME';
//  end;
end;

procedure TfrmFind.Init  ;
begin

end;

procedure TfrmFind.ADOQuery1AfterScroll(DataSet: TDataSet);
var
  i,j:Integer;
begin
  with  DBGridEh1 do
  begin
    if (DataSource.DataSet.FieldByName('FieldDataType').Value='ftString') then
    with FieldColumns['Oper'] do
    begin
      PickList.Clear;
      PickList.Add('=');
      PickList.Add('≈');
    end
    else
    if DataSource.DataSet.FieldByName('FieldDataType').Value='ftBCD' then
    with FieldColumns['Oper'] do
    begin
      PickList.Clear;
      PickList.Add('=');
      PickList.Add('>');
      PickList.Add('>=');
      PickList.Add('<');
      PickList.Add('<=');
      PickList.Add('<>');
      PickList.Add('><');
    end
    else
    if DataSource.DataSet.FieldByName('FieldDataType').Value='ftDate' then
    with FieldColumns['Oper'] do
    begin
      PickList.Clear;
      PickList.Add('=');
      PickList.Add('>');
      PickList.Add('>=');
      PickList.Add('<');
      PickList.Add('<=');
      PickList.Add('<>');
      PickList.Add('><');
    end
  end;

  with    ADOQuery1  do
  begin
    DBGridEh1.FieldColumns['Condvalu'].PickList.Clear;
    for i:=0 to High(Query_Info) do
    if Query_Info[i].L_AddItem<>nil then
    begin
      if  FieldByName('FieldName').IsNull=False then
      if  UpperCase(FieldByName('FieldName').Value) = UpperCase(Query_Info[i].L_DropdownField) then
      begin
        for j:=0 to High(Query_Info[i].L_AddItem) do
        begin
          DBGridEh1.FieldColumns['Condvalu'].PickList.Add(Query_Info[i].L_AddItem[j]);
        end;
      end;
    end
    else
    if Query_Info[i].L_ListDataSetName<>nil then
    begin
      if  FieldByName('FieldName').IsNull=False then
      if  UpperCase(FieldByName('FieldName').Value) = UpperCase(Query_Info[i].L_DropdownField) then
      DBGridEh1.FieldColumns['Condvalu'].PickList.Add(' ');
    end;
  end;
end;

procedure TfrmFind.ADOQuery1CondvaluSetText(Sender: TField;
  const Text: string);
begin
  if Sender.DataSet.FieldByName('FieldDataType').Value='ftDate' then
    begin
      if (Text)<>''  then
        Sender.Value:=FormatDateTime('yyyy-mm-dd',StrToDate(Text))  //    Sender.Value
      else
        Sender.Value :='';
    end
  else
    Sender.Value :=Text;
end;

procedure TfrmFind.Button1Click(Sender: TObject);
begin
  strWhere:='';
  with ADOQuery1 do
  begin
    if State= dsEdit then
      Post;
    try
      DisableControls;
      First;
      while not Eof do
      begin
        if (FieldByName('Condvalu').IsNull=False) and (FieldByName('Condvalu').AsString<>'') then
        begin
          if  (FieldByName('Oper').Value='><' )and(trim(FieldByName('Condvalu2').AsString)='')  then
          begin
            ShowMessage(FieldByName('Condvalu2').DisplayLabel+':不能为空，因为运算符设置的是介于。');
            Exit;
          end;

          if (FieldByName('FieldDataType').AsString='ftString') then
            begin
              if FieldByName('FieldKind').Value =0 then
              begin
                if FieldByName('Oper').Value='≈' then
                  strWhere:=  strWhere +  Trim(FieldByName('FieldName').AsString)
                    +' Like '+ QuotedStr('%'+trim(FieldByName('Condvalu').AsString)+'%')+' and '
                else
                  strWhere:=  strWhere +  Trim(FieldByName('FieldName').AsString)
                    +' = '+ QuotedStr(trim(FieldByName('Condvalu').AsString))+' and ';
              end;
            end
          else
          if FieldByName('FieldDataType').AsString='ftDate' then     //如果是日期型字段
            begin
              begin
                if FieldByName('Oper').Value='><' then             //如果是介于
                  strWhere:=  strWhere + Trim(FieldByName('FieldName').AsString)
                    +' between  '+ QuotedStr(FieldByName('Condvalu').AsString)
                    +' and ' + QuotedStr(FieldByName('Condvalu2').AsString)+' and '
                else
                  strWhere:=  strWhere +   Trim(FieldByName('FieldName').AsString)
                  +FieldByName('Oper').AsString+ QuotedStr(FieldByName('Condvalu').AsString)+' and '  ;
              end;
            end
          else
          if FieldByName('FieldDataType').AsString='ftBCD' then  //如果是数值型字段
            begin
              if FieldByName('Oper').Value='><' then             //如果是介于
                strWhere:=  strWhere+  Trim(FieldByName('FieldName').AsString)
                +' between  '+ FieldByName('Condvalu').AsString+' and ' + FieldByName('Condvalu2').AsString+' and '
              else
                strWhere:=  strWhere + Trim(FieldByName('FieldName').AsString)
                +FieldByName('Oper').AsString+ FieldByName('Condvalu').AsString+' and '  ;
            end;
        end;
        Next;
      end;
    finally
      EnableControls;
    end;
  end;
  strWhere:=Copy( strWhere,0,Length(strWhere)-5);
  ModalResult:=mrOk;
end;

procedure TfrmFind.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmFind.ADOQuery1Condvalu2SetText(Sender: TField;
  const Text: String);
begin
  if Sender.DataSet.FieldByName('FieldDataType').Value='ftDate' then
    begin
      if (Text)<>''  then
        Sender.Value:=FormatDateTime('yyyy-mm-dd',StrToDate(Text))  //    Sender.Value
      else
        Sender.Value :='';
    end
  else
    Sender.Value :=Text;
end;

end.
