unit Findcds_unt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,  DB, ADODB,  DBGridEh, StdCtrls, Buttons,PublicFile,
  ExtCtrls, Grids, DBClient, Provider,Contnrs,SelectItem_unt;

type
  TFindcds_frm = class(TForm)
    DataSource1: TDataSource;
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
    dt1: TClientDataSet;
    dt1FieldName: TStringField;
    dt1FieldDataType: TStringField;
    dt1FieldKind: TSmallintField;
    dt1FieldCaption: TWideStringField;
    dt1Oper: TStringField;
    dt1Condvalu: TStringField;
    dt1Condvalu2: TStringField;
    dt1FieldName1: TStringField;
    procedure Button1Click(Sender: TObject);
    procedure dt1CondvaluSetText(Sender: TField; const Text: string);
    procedure Button2Click(Sender: TObject);
    procedure dt1AfterScroll(DataSet: TDataSet);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dt1OperGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure dt1OperSetText(Sender: TField; const Text: String);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure DBGridEh1Columns4EditButtonClick(Sender: TObject;
      var Handled: Boolean);
    procedure dt1CondvaluChange(Sender: TField);
  private
     DropDown_Info_List1:  TObjectList ;  //DropDown_Info的容器变量
     StrWhere:string;
    { Private declarations }
  protected
    function str_Reset(str:string;str_type:Integer=1):string;
  public

    { Public declarations }
  end;

var
  Findcds_frm: TFindcds_frm;

Function ShowfrmFindcds(Acds:TDataSet;out vStrWhere:string;var ADropDown_Info_List:TObjectList;
        const NotDisplayFields:array of String;const DisplayFields:array of string;
        const FieldsName:array of String;const QueryFieldsName:array of string;
        Def_FieldName:array of String;Find_Def_Oper:array of String;
        Def_FieldValue:array of String;  Def_Field2Value:array of String;
        const F_h:Integer=0;const F_w:Integer=0):Boolean;StdCall;

implementation

uses SelectedDate_unt;

{$R *.dfm}

Function ShowfrmFindcds(Acds:TDataSet;out vStrWhere:string;var ADropDown_Info_List:TObjectList;
        const NotDisplayFields:array of String;const DisplayFields:array of string;
        const FieldsName:array of String;const QueryFieldsName:array of string;
        Def_FieldName:array of String;Find_Def_Oper:array of String;
        Def_FieldValue:array of String;  Def_Field2Value:array of String;
        const F_h:Integer=0;const F_w:Integer=0):Boolean;
var
  I,J,K:Integer;
  B_IsDisplay :Boolean;
  Form_Height :Integer;
begin
  Result:=False;
  Findcds_frm:=TFindcds_frm.Create(Application);
  with Findcds_frm     do
  try
    begin
      Font.Size      := Application.MainForm.Font.Size;
      Font.Charset   := Application.MainForm.Font.Charset;
      Font.Name      := Application.MainForm.Font.Name;
      DropDown_Info_List1:= ADropDown_Info_List;
      with dt1 do
      begin
        FieldDefs.Add('FieldName',ftstring,50);
        FieldDefs.Add('FieldName1',ftstring,50);
        FieldDefs.Add('FieldDataType',ftstring,15);
        FieldDefs.Add('FieldKind',ftinteger);
        FieldDefs.Add('FieldCaption',ftWidestring,50);
        FieldDefs.Add('Oper',ftstring,50);
        FieldDefs.Add('Condvalu',ftstring,50);
        FieldDefs.Add('Condvalu2',ftstring,50);
        CreateDataSet;                     //建立数据集
        Open;
      end;

      if High(DisplayFields)>0then
      begin
        for j:=0 to High(DisplayFields) do
        begin
          for i:=0 to Acds.FieldCount-1 do
          if UpperCase(Acds.Fields[i].FieldName)=UpperCase(DisplayFields[j])then
          if  Acds.FieldByName(DisplayFields[j]).DataType <> ftAutoInc then        //不是自动编号字段
          begin
            with dt1 do
            begin
              Append;
              FieldByName('FieldCaption').Value:= Acds.Fields[i].DisplayLabel;
              FieldByName('FieldName').Value:= Acds.Fields[i].FieldName;
              FieldByName('FieldName1').Value:=FieldByName('FieldName').Value;
              FieldByName('FieldDataType').Value:= Acds.Fields[i].DataType;//FieldName;
              with Acds.FieldByName(DisplayFields[j]) do
              begin
                if  DataType in [ftString,ftWideString] then
                begin
                  FieldByName('FieldDataType').Value:='ftString'  ;
                  FieldByName('Oper').Value :='LIKE';
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
                  FieldByName('Oper').Value :='>=';
                end
                else
                if  DataType in [ftBoolean] then
                begin
                  FieldByName('FieldDataType').Value:='ftBoolean';
                  FieldByName('Oper').Value :='=';
                end;
              end;
              Post;
            end;
          end;
        end;
      end
      else
      for i:=0 to Acds.FieldCount-1 do
      begin
        B_IsDisplay:=True;
        for j:=0 to High(NotDisplayFields) do
        begin
          if UpperCase(Acds.Fields[i].FieldName)=UpperCase(NotDisplayFields[j])then
          begin
            B_IsDisplay:=False;
            Break;
          end;
        end;

        if  B_IsDisplay then
        if not (Acds.Fields[i].DataType In[ftAutoInc,ftBoolean]) then
        with dt1 do
        begin
          Append;
          FieldByName('FieldCaption').Value:= Acds.Fields[i].DisplayLabel;
          FieldByName('FieldName').Value:= Acds.Fields[i].FieldName;
          FieldByName('FieldName1').Value:=FieldByName('FieldName').Value;
          FieldByName('FieldDataType').Value:= Acds.Fields[i].DataType;//FieldName;
          with Acds.Fields[i] do
          begin
            if  DataType in [ftString,ftWideString] then
            begin
              FieldByName('FieldDataType').Value:='ftString'  ;
              FieldByName('Oper').Value :='LIKE';
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
            end
            else
            if  DataType in [ftBoolean] then
            begin
              FieldByName('FieldDataType').Value:='ftBoolean';
              FieldByName('Oper').Value :='=';
            end;
          end;
          Post;
        end;
      end;
    end;
//    如果查询字段在多个表中同时存在，就需要重新指定字段的表名。
    with  dt1 do
    begin
      first;
      while not Eof do
      begin
        for i:=0 to High(FieldsName)do
        begin
          if UpperCase(FieldByName('FieldName').Value)=UpperCase(FieldsName[i]) then
          begin
            Edit;
            FieldByName('FieldName1').Value:= QueryFieldsName[i];
            Post;
          end;
        end;
        Next;
      end;
    end;

      //查询条件设置默认值
      for K:=0 to High(Def_FieldName) do
      begin
        with dt1 do
        begin
          if Locate('FieldName',Def_FieldName[K],[]) then
          begin
            Edit;
            FieldByName('Oper').Value     :=  Find_Def_Oper[K];
            FieldByName('Condvalu').Value :=  FormatDateTime('yyyy-mm-dd HH:NN:SS',StrToDateTime(Def_FieldValue[K]));
            if (Def_Field2Value[K]<>'')and(VarIsNull(Def_Field2Value[K])=False) then
               FieldByName('Condvalu2').Value :=  FormatDateTime('yyyy-mm-dd HH:NN:SS',StrToDateTime( Def_Field2Value[K]));
            Post;
          end;
        end;
      end;

      if  F_w>0 then
      Width:=F_w;
                                //设备窗体的自动适应高度
      Form_Height:=( dt1.RecordCount+1 )*17+100;
      if  Form_Height < 200 then
      Form_Height:=200;
      if  Form_Height > 600 then
      Form_Height:=600;
      height:= Form_Height;

      if ShowModal=mrOk then
      begin
        if  StrWhere='' then
        StrWhere:=' 1=1';
        vStrWhere:=StrWhere;
        Result:=True;
      end;
  finally
    Free;
  end;
end;

function TFindcds_frm.str_Reset(str:string;str_type:Integer=1):string;
var
  s_list:TStrings;
  i:Integer;
  v_str:string;
begin
  Result:='';
  if Trim(str)='' then
    Exit;
  s_list:=TStringList.Create;
  v_str:= str;
  v_str := StringReplace(v_str, '，', ',', [rfReplaceAll]) ;
  v_str := StringReplace(v_str, '；', ',', [rfReplaceAll]) ;
  v_str := StringReplace(v_str, ';', ',', [rfReplaceAll]) ;
  s_list.CommaText:= v_str;
  v_str:='';
  for i:=0 to  s_list.count-1 do
  begin
    if str_type=1 then
      v_str:=v_str+ QuotedStr(Trim( s_list[i] ))+' , '
    else
    if str_type=2 then
      v_str:=v_str+ Trim( s_list[i] )+' , '  ;
  end;
  v_str:='( '+Copy(v_str,0,Length(v_str)-2)+' )';
  Result:=v_str;
end;

procedure TFindcds_frm.DBGridEh1Columns4EditButtonClick(Sender: TObject;
  var Handled: Boolean);
var
  i:Integer;
begin
  try
    Screen.Cursor := crHourGlass;
    if UpperCase(dt1.FieldByName('FieldDataType').AsString)= UpperCase('ftDate') then
    begin
       Show_SelectedDate_frm(Self,dt1,Curr_Date)      ;
      Exit;
    end;

    for i:=0 to DropDown_Info_List1.Count-1 do
    with  DropDown_Info_List1.Items[i] as TDropDownInfo do
    begin
      if  UpperCase(dt1.FieldByName('FieldName').Value) = UpperCase(L_DropdownColumn) then
      if (L_FindDataSet<>nil)or(L_ListDataSet<>nil) then
      begin
        if (L_FindDataSet=nil) then
        begin
          if L_ListDataSet<>nil then
              if Show_Item_frm(L_ListDataSet,L_ListDataSetFilterField,
                      Trim(dt1.FieldByName('Condvalu').AsString),L_ColsInfo,
                        (Sender as TControl)) then
          begin
            if  dt1.State <>dsEdit then
               dt1.Edit;
            dt1.FieldByName('Condvalu').Value:=
                Trim(L_ListDataSet.FieldByName(L_ListResultField).Value);
            dt1.FieldByName('Oper').Value :='=';     //如果用户是从列表中选取一行记录，操作符改为“=”号
            if L_ListDataSet.Filtered then
            L_ListDataSet.Filtered :=False;
          end  ;
        end
        else
        begin
          if Show_Item_frm(L_FindDataSet,L_ListResultField,
               Trim(dt1.FieldByName('Condvalu').AsString),L_ColsInfo, (Sender as TControl)) then   //
          begin
            if  dt1.State <>dsEdit then
               dt1.Edit;
            dt1.FieldByName('Condvalu').Value:=
                Trim(L_FindDataSet.FieldByName(L_ListResultField).Value);
            dt1.FieldByName('Oper').Value :='=';     //如果用户是从列表中选取一行记录，操作符改为“=”号
            if L_FindDataSet.Filtered then
            L_FindDataSet.Filtered :=False;
          end  ;
        end ;
        break;  //结束循环
      end ;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFindcds_frm.dt1AfterScroll(DataSet: TDataSet);
var
  i,j:Integer;
begin
  DBGridEh1.FieldColumns['Condvalu'].ButtonStyle:=cbsAuto;
  with  DBGridEh1 do
  begin
    if DataSource.DataSet.FieldByName('FieldDataType').Value='ftString' then
    with FieldColumns['Oper'] do
    begin
      PickList.Clear;
      PickList.add('等于');
      PickList.add('不等于');
      PickList.add('相似');
      PickList.add('包含');
    end
    else
    if DataSource.DataSet.FieldByName('FieldDataType').Value='ftBCD' then
    with FieldColumns['Oper'] do
    begin
      PickList.Clear;
      PickList.add('等于');
      PickList.add('不等于');
      PickList.add('小于');
      PickList.add('小于等于');
      PickList.add('大于');
      PickList.add('大于等于');
      PickList.add('范围之内');
      PickList.add('包含');
    end
    else
    if DataSource.DataSet.FieldByName('FieldDataType').Value='ftDate' then
    with FieldColumns['Oper'] do
    begin
      PickList.Clear;
      PickList.add('等于');
      PickList.add('不等于');
      PickList.add('小于');
      PickList.add('小于等于');
      PickList.add('大于');
      PickList.add('大于等于');
      PickList.add('范围之内');
      DBGridEh1.FieldColumns['Condvalu'].ButtonStyle:=cbsEllipsis;
    end
    else
    if DataSource.DataSet.FieldByName('FieldDataType').Value='ftBoolean' then
    begin
      with FieldColumns['Oper'] do
      begin
        PickList.Clear;
        PickList.Add('等于');
      end ;

    end;
  end;

  with    dt1  do
  begin
    DBGridEh1.FieldColumns['Condvalu'].PickList.Clear;
    for i:=0 to DropDown_Info_list1.Count-1 do
    begin
      with  DropDown_Info_list1.Items[i] as TDropDownInfo do
      if L_AddPickList<>nil then
      begin
        if  FieldByName('FieldName').IsNull=False then
        if  UpperCase(FieldByName('FieldName').Value) = UpperCase(L_DropdownColumn) then
        begin
          for j:=0 to High(L_AddPickList) do             //表格添加下拉列表项
          begin
            DBGridEh1.FieldColumns['Condvalu'].PickList.Add(L_AddPickList[j]);
          end;
        end;
      end
      else
      if (L_FindDataSet<>nil)or(L_ListDataSet<>nil) then
      begin

        if  FieldByName('FieldName').IsNull=False then
        if  UpperCase(FieldByName('FieldName').Value) = UpperCase(L_DropdownColumn) then
        begin
          DBGridEh1.FieldColumns['Condvalu'].ButtonStyle:=cbsEllipsis;
          exit;
        end;
      end ;
    end;
    if dt1.FieldByName('FieldDataType').Value='ftBoolean' then
      with DBGridEh1.FieldColumns['Condvalu'] do
      begin
        PickList.Clear;
        PickList.Add('是');
        PickList.Add('否');
      end ;
  end;

  with    dt1  do
  begin
    if dt1.FieldByName('FieldDataType').Value='ftBoolean' then
    with DBGridEh1.FieldColumns['Condvalu'] do
    begin
      PickList.Clear;
      PickList.Add('是');
      PickList.Add('否');
    end ;
  end;
end;

procedure TFindcds_frm.dt1CondvaluSetText(Sender: TField;
  const Text: string);
begin
  if Sender.DataSet.FieldByName('FieldDataType').Value='ftDate' then
    begin
      if (Text)<>''  then
        begin
          if IsDateTime(Text) =False then
          begin
            MsgError('“'+trim(Text)+'”不是有效的日期。');
            Exit;
          end;
          Sender.Value:=FormatDateTime('yyyy-mm-dd HH:NN:SS',StrToDateTime(Text));  //    Sender.Value
        end
      else
        Sender.Value :='';
    end
  else
    Sender.Value :=Text;
end;

procedure TFindcds_frm.Button1Click(Sender: TObject);
var
  i,j:Integer;
  SQLisAdd :Boolean;
begin
  strWhere:='';
  with dt1 do
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
          if  (FieldByName('Oper').Value='BETWEEN' ) then
          begin
            if  (trim(FieldByName('Condvalu2').AsString)='') then
            begin
              MsgError('“'+trim(FieldByName('FieldCaption').AsString)
              +'”的查询值2不能为空，因为选择的条件关系是'+dbgrideh1.FieldColumns['Oper'].DisplayText+'。');
              Exit;
            end;
            if FieldByName('Condvalu').Value> FieldByName('Condvalu2').Value then
            begin
              MsgError('“'+trim(FieldByName('FieldCaption').AsString)+'”的查询值不能大于查询值2。');
              Exit;
            end;
          end;

          if FieldByName('FieldDataType').AsString='ftString' then
            begin
              begin
                if FieldByName('Oper').Value='LIKE' then
                  strWhere:=  strWhere +' ( '+  Trim(FieldByName('FieldName1').AsString)
                    +' Like '+ QuotedStr('%'+trim(FieldByName('Condvalu').AsString)+'%')+' )  and '
                else
                if FieldByName('Oper').Value='IN' then
                begin
                  strWhere:=  strWhere +' ( '+  Trim(FieldByName('FieldName1').AsString)
                    +' In '+str_reset( trim(FieldByName('Condvalu').AsString))+' )  and '
                end
                else
                begin
                  strWhere:=  strWhere +' ( '+  Trim(FieldByName('FieldName1').AsString)
                    +FieldByName('Oper').AsString+ QuotedStr(trim(FieldByName('Condvalu').AsString))+' )  and ';
                end;
              end;
            end
          else
          if FieldByName('FieldDataType').AsString='ftDate' then     //如果是日期型字段
            begin
              begin
                if FieldByName('Oper').Value='BETWEEN' then             //如果是介于
                  begin
                    strWhere:=  strWhere +' ( '+ Trim(FieldByName('FieldName1').AsString)
                      +' between  '+ QuotedStr(FieldByName('Condvalu').AsString)
                      +' and ' + QuotedStr(FieldByName('Condvalu2').AsString)+' )  and ';
                  end
                else
                  strWhere:=  strWhere +' ( '+   Trim(FieldByName('FieldName1').AsString)
                  +FieldByName('Oper').AsString+ QuotedStr(FieldByName('Condvalu').AsString)+' )  and '  ;
              end;
            end
          else
          if FieldByName('FieldDataType').AsString='ftBoolean' then     //如果是布尔型字段Bool
            begin
              if FieldByName('Condvalu').AsString<>'' then
              begin
                if FieldByName('Condvalu').AsString='是' then
                  strWhere:=  strWhere +' ( '+   Trim(FieldByName('FieldName1').AsString)+
                  '= 1  ) and '
                else
                if FieldByName('Condvalu').AsString='否' then
                  strWhere:=  strWhere +' ( '+   Trim(FieldByName('FieldName1').AsString)+
                  '= 0  ) and '
              end;
            end
          else
          if (FieldByName('FieldDataType').AsString ='ftBCD')or
             (FieldByName('FieldDataType').AsString ='ftInteger')then  //如果是数值型字段
            begin
              SQLisAdd:=False;
              for i:=0 to DropDown_Info_List1.Count-1 do
              begin
                with  DropDown_Info_List1.Items[i] as TDropDownInfo do
                if  UpperCase(FieldByName('FieldName').Value) = UpperCase(L_DropdownColumn) then
                begin
                  if L_AddPickList<>nil then
                  begin
                    for j:=0 to High(L_AddPickList) do
                    begin
                      if UpperCase(L_AddPickList[j])=UpperCase(FieldByName('Condvalu').AsString ) then
                       strWhere:=  strWhere +' ( '+ Trim(FieldByName('FieldName1').AsString)
                      +FieldByName('Oper').AsString+L_PickListResultValues[j]+' )  and '  ;
                      SQLisAdd:=True;
                    end;
                  end ;
                end ;
              end;

              if SQLisAdd=False then
              begin
                if FieldByName('Oper').Value='BETWEEN' then             //如果是介于
                begin
                  if (IsNumeric(FieldByName('Condvalu').AsString)=False)or(IsNumeric(FieldByName('Condvalu2').AsString)=False) then
                  begin
                    MsgError('查询条件“'+Trim(FieldByName('FieldCaption').AsString)+'”的值，不是有效的数值。');
                    Exit;
                  end;

                  strWhere:=  strWhere+' ( '+  Trim(FieldByName('FieldName1').AsString)
                  +' between  '+ FieldByName('Condvalu').AsString+' and ' + FieldByName('Condvalu2').AsString+' )  and '  ;
                end
                else
                if FieldByName('Oper').Value='IN' then
                begin
                  strWhere:=  strWhere +' ( '+  Trim(FieldByName('FieldName1').AsString)
                    +' In '+ str_Reset(FieldByName('Condvalu').AsString,2)+' )  and '
                end
                else
                begin
                  if (IsNumeric(FieldByName('Condvalu').AsString)=False) then
                  begin
                    MsgError('查询条件“'+Trim(FieldByName('FieldCaption').AsString)+'”的值，不是有效的数值。');
                    Exit;
                  end;
                  strWhere:=  strWhere +' ( '+ Trim(FieldByName('FieldName1').AsString)
                  +FieldByName('Oper').AsString+ FieldByName('Condvalu').AsString+' )  and '  ;
                end;
              end;
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

procedure TFindcds_frm.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TFindcds_frm.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key in[VK_INSERT,VK_delete] then
  begin
    Key:=0;
  end
  else
  with   (Sender as TDBGridEh ).DataSource.DataSet  do
  if (Key in[VK_down])and(RecNo=RecordCount ) then    //如果击向下键，且当前记录号等于总记录数
  begin
    Key:=0;
  end;
end;

procedure TFindcds_frm.dt1OperGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  if Sender.AsString='=' then
    text:='等于'
  else
  if Sender.AsString='<>' then
    text:='不等于'
  else
  if Sender.AsString='<' then
    text:='小于'
  else
  if Sender.AsString='<=' then
    text:='小于等于'
  else
  if Sender.AsString='>' then
    text:='大于'
  else
  if Sender.AsString='>=' then
    text:='大于等于'
  else
  if Sender.AsString='LIKE' then
    text:='相似'
  else
  if Sender.AsString='BETWEEN' then
    text:='范围之内'
  else
  if Sender.AsString='IN' then
    text:='包含';
end;

procedure TFindcds_frm.dt1OperSetText(Sender: TField; const Text: String);
begin
  if text='等于'  then
     Sender.AsString:='='
  else
  if text='不等于'   then
    Sender.AsString:='<>'
  else
  if text='小于'  then
    Sender.AsString:='<'
  else
  if text='小于等于'  then
    Sender.AsString:='<='
  else
  if  text='大于' then
    Sender.AsString:='>'
  else
  if text='大于等于'  then
    Sender.AsString:='>='
  else
  if text='相似'  then
    Sender.AsString:='LIKE'
  else
  if text='范围之内'  then
    Sender.AsString:='BETWEEN'
  else
  if text='包含'  then
    Sender.AsString:='IN'   ;
end;

procedure TFindcds_frm.DBGridEh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if (Sender as TDBGridEh).SumList.RecNo mod 2 = 1 then     // .SumList
   Background := $00FFC4C4;
end;



procedure TFindcds_frm.dt1CondvaluChange(Sender: TField);
begin

  if Sender.IsNull=False then
  begin
    if (Pos(',', Sender.AsString)>0)or(Pos(';', Sender.AsString)>0)
     or(Pos('，', Sender.AsString)>0)or(Pos('；', Sender.AsString)>0)  then //只要包含这4个字符
    begin
      if dt1.FieldByName('Oper').AsString<>'IN' then
      if messagebox(Self.Handle,'你输入了“，”或“；”，你要将当前条件关系改为包含吗？','询问',MB_yesno+MB_iconquestion)=mrYes then
      begin
        dt1.FieldByName('Oper').Value:='IN' ;
      end;
    end
    else
    begin
      if dt1.FieldByName('Oper').AsString='IN' then
      if messagebox(Self.Handle,'你没有输入“，”或“；”，你要当前将条件关系改为相似吗？','询问',MB_yesno+MB_iconquestion)=mrYes then
      dt1.FieldByName('Oper').Value:='LIKE' ;
    end;
  end
end;

end.
