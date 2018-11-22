unit formFindcds;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,  DB, ADODB,  DBGridEh, StdCtrls, Buttons,
  ExtCtrls, Grids, DBClient, Provider;

type
  TfrmFindcds = class(TForm)
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
    dspRead: TDataSetProvider;
    dtRead: TADODataSet;
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
    procedure DBGridEh1Columns4EditButtonClick(Sender: TObject;
      var Handled: Boolean);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dt1OperGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure dt1OperSetText(Sender: TField; const Text: String);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
  private
     StrWhere:string;
    { Private declarations }
  protected
    function str_Reset(str:string;str_type:Integer=1):string;
  public
    procedure FindUnitInit; virtual;
    { Public declarations }
  end;

var
  frmFindcds: TfrmFindcds;


Function ShowfrmFindcds(AOwnerForm:TForm; Acds:TDataSet;out vStrWhere:string;
        const NotDisplayFields:array of String;const DisplayFields:array of string;
        const FieldsName:array of String;const QueryFieldsName:array of string;
        Def_FieldName:array of String;Find_Def_Oper:array of String;
        Def_FieldValue:array of String;  Def_Field2Value:array of String;
        const F_h:Integer=0;const F_w:Integer=0):Boolean;StdCall;

implementation

uses   SelectItemUnit,   SelectedDate_unt, damo, PublicFunc;

{$R *.dfm}

Function ShowfrmFindcds(AOwnerForm:TForm; Acds:TDataSet;out vStrWhere:string;
        const NotDisplayFields:array of String;const DisplayFields:array of string;
        const FieldsName:array of String;const QueryFieldsName:array of string;
        Def_FieldName:array of String;Find_Def_Oper:array of String;
        Def_FieldValue:array of String;  Def_Field2Value:array of String;
        const F_h:Integer=0;const F_w:Integer=0):Boolean;
var
  I,J:Integer;
  B_IsDisplay :Boolean;
begin
  Result:=False;
  try
    with frmFindcds     do
    begin
      frmFindcds:=TfrmFindcds.Create(Application);
      Font.Size:= AOwnerForm.Font.Size;
      Font.Charset:= AOwnerForm.Font.Charset;
      Font.Name:= AOwnerForm.Font.Name;
    end;

    if frmFindcds.dt1.Active then
    frmFindcds.dt1.Close;
    frmFindcds.dt1.Open;
//    for i:=0 to Acds.FieldCount-1 do
    begin
      if High(DisplayFields)>0then
      begin
  //      with Acds.FieldByName(DisplayFields[j])do
        for j:=0 to High(DisplayFields) do
        begin
          for i:=0 to Acds.FieldCount-1 do
          if UpperCase(Acds.Fields[i].FieldName)=UpperCase(DisplayFields[j])then
          if  Acds.FieldByName(DisplayFields[j]).DataType <> ftAutoInc then        //不是自动编号字段
          begin
            with frmFindcds.dt1 do
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

//                if FieldKind= fkData then           //   如果是LOOKUP字段
//                  FieldByName('FieldKind').Value:=0
//                else
//                if FieldKind= fkLookup then           //   如果是LOOKUP字段
//                  FieldByName('FieldKind').Value:=1
//                else
//                if FieldKind= fkCalculated then       //  如果是计算字段
//                  FieldByName('FieldKind').Value:=2;
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
        with frmFindcds.dt1 do
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

//            if FieldKind= fkData then           //   如果是LOOKUP字段
//              FieldByName('FieldKind').Value:=0
//            else
//            if FieldKind= fkLookup then           //   如果是LOOKUP字段
//              FieldByName('FieldKind').Value:=1
//            else
//            if FieldKind= fkCalculated then       //  如果是计算字段
//              FieldByName('FieldKind').Value:=2;
          end;
          Post;
        end;
      end;
    end;
//    如果查询字段在多个表中同时存在，就需要重新指定字段的表名。
    with  frmFindcds.dt1 do
    begin
      first;
      while not Eof do
      begin
        for i:=0 to High(FieldsName)do
        begin
          if UpperCase(frmFindcds.dt1.FieldByName('FieldName').Value)=UpperCase(FieldsName[i]) then
          begin
            frmFindcds.dt1.Edit;
            frmFindcds.dt1.FieldByName('FieldName1').Value:= QueryFieldsName[i];
            frmFindcds.dt1.Post;
          end;
        end;
        Next;
      end;
    end;

    with   frmFindcds do
    begin
      //查询条件设置默认值
      for i:=0 to High(Def_FieldName) do
      begin
        with dt1 do
        begin
          if Locate('FieldName1',Def_FieldName[i],[]) then
          begin
            Edit;
            FieldByName('Oper').Value     :=  Find_Def_Oper[i];
            FieldByName('Condvalu').Value :=  Def_FieldValue[i];
            if Def_Field2Value[i]='' then
               FieldByName('Condvalu2').Value :=  Def_Field2Value[i];
            Post;
          end;
        end;
      end;

      if  F_w>0 then
      Width:=F_w;
      if F_h>0 then
      Height:=F_h;
      
      FindUnitInit;
      if ShowModal=mrOk then
      begin
        if  StrWhere='' then
        StrWhere:=' 1=1';
        vStrWhere:=StrWhere;
        Result:=True;
      end;
    end;
  finally
    frmFindcds.Free;
  end;
end;

function TfrmFindcds.str_Reset(str:string;str_type:Integer=1):string;
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

procedure TfrmFindcds.DBGridEh1Columns4EditButtonClick(Sender: TObject;
  var Handled: Boolean);
var
  i,I_DropDataSetCount,FieldsDisplayWidth ,I_Width,I_Left,I_Top        :Integer;
  X,H :Integer;
  Vpoint    :Tpoint;
begin
//  for i:=0 to High(DropDown_Info) do
//  with DropDown_Info[i] do
  try
    Screen.Cursor := crHourGlass;
    if UpperCase(dt1.FieldByName('FieldDataType').AsString)= UpperCase('ftDate') then
    begin
       Show_SelectedDate_frm(Self,dt1,Find_Curr_Date)      ;
      Exit;
    end;

    Vpoint   := (Sender as TControl).Parent.ClientToScreen(Point((Sender as TControl).Left,(Sender as TControl).Top));
    I_Top:= Vpoint.y+(Sender as TControl).Height;

    for i:=0 to High(DropDown_Info) do
    if  UpperCase(dt1.FieldByName('FieldName').Value) = UpperCase(DropDown_Info[i].L_DropdownColumn) then
    if DropDown_Info[i].L_ListDataSetName<>nil then
    with DropDown_Info[i] do
    begin
      if L_FormWidth=0 then
      begin
        for I_DropDataSetCount:=0 to L_ListDataSetName.FieldCount-1 do
        begin
          if  L_ListDataSetName.Fields[I_DropDataSetCount].Visible then
          FieldsDisplayWidth :=FieldsDisplayWidth+L_ListDataSetName.Fields[I_DropDataSetCount].DisplayWidth ;
        end;
        L_FormWidth:=(FieldsDisplayWidth*63 div 10)+40;   //  自动重新设置下拉窗口的显示宽度
      end;
      if L_FormWidth<330 then
        I_Width:=330     //不能小于330
      else
        I_Width:=L_FormWidth;
      if I_Width>700 then
        I_Width:=700;     //不能超过700
      if L_FormHeight  =0 then
        H:=240
      else
        H:=L_FormHeight;
      x:=Screen.Width- Vpoint.X-I_Width+ (Sender as TControl).Parent.Width;
      if x<0 then
        I_Left:=Screen.Width -I_Width//- (Sender as TControl).Parent.Width
      else
        I_Left:= Vpoint.X- (Sender as TControl).Parent.Width;

      if  (Screen.Height-I_Top)< h then   //屏幕的高度-控件按钮所在的高度  小于弹出窗口的高度
        I_Top:=Screen.Height-h;
//      x:=Screen.Width- Vpoint.X-I_Width- (Sender as TControl).Parent.Width;
//      if x<0 then
//        L:=Screen.Width -w- (Sender as TControl).Parent.Width
//      else
//        L:= Vpoint.X- (Sender as TControl).Parent.Width;
//       //屏幕的高度-控件按钮所在的高度  小于弹出窗口的高度
//      if  (Screen.Height-t)<   h then
//      t:=Screen.Height-h;
      if ShowAddListForm(Self,DropDown_Info[i].L_ListDataSetName,DropDown_Info[i].L_ListResultField,
           Trim(dt1.FieldByName('Condvalu').AsString),I_Left,I_Top,I_Width) then   //
      begin
        if  dt1.State <>dsEdit then
           dt1.Edit;
        dt1.FieldByName('Condvalu').Value:=
            Trim(DropDown_Info[i].L_ListDataSetName.FieldByName(DropDown_Info[i].L_ListResultField).Value);
        dt1.FieldByName('Oper').Value :='=';     //如果用户是从列表中选取一行记录，操作符改为“=”号
        if DropDown_Info[i].L_ListDataSetName.Filtered then
        DropDown_Info[i].L_ListDataSetName.Filtered :=False;
      end  ;
    end ;
    //这行先注释掉6-27
    for i:=0 to High(Query_Info) do
    if  UpperCase(dt1.FieldByName('FieldName').Value) = UpperCase(Query_Info[i].L_DropdownColumn) then
    if Query_Info[i].L_ListDataSetName<>nil then
    with Query_Info[i] do
    begin
      if L_FormWidth=0 then
      begin
        for I_DropDataSetCount:=0 to L_ListDataSetName.FieldCount-1 do
        begin
          if  L_ListDataSetName.Fields[I_DropDataSetCount].Visible then
          FieldsDisplayWidth :=FieldsDisplayWidth+L_ListDataSetName.Fields[I_DropDataSetCount].DisplayWidth ;
        end;
        L_FormWidth:=(FieldsDisplayWidth*63 div 10)+40;   //  自动重新设置下拉窗口的显示宽度
      end;
      if L_FormWidth<330 then
        I_Width:=330     //不能小于330
      else
        I_Width:=L_FormWidth;
      if I_Width>700 then
        I_Width:=700;     //不能超过700
      if L_FormHeight  =0 then
        H:=240
      else
        H:=L_FormHeight;
      x:=Screen.Width- Vpoint.X-I_Width+ (Sender as TControl).Parent.Width;
      if x<0 then
        I_Left:=Screen.Width -I_Width//- (Sender as TControl).Parent.Width
      else
        I_Left:= Vpoint.X- (Sender as TControl).Parent.Width;

      if  (Screen.Height-I_Top)< h then   //屏幕的高度-控件按钮所在的高度  小于弹出窗口的高度
        I_Top:=Screen.Height-h;

      if ShowAddListForm(Self,Query_Info[i].L_ListDataSetName,Query_Info[i].L_ListResultField,
           Trim(dt1.FieldByName('Condvalu').AsString),I_Left,I_Top,I_Width) then   //
      begin
        if  dt1.State <>dsEdit then
           dt1.Edit;
        dt1.FieldByName('Condvalu').Value:=
            Trim(Query_Info[i].L_ListDataSetName.FieldByName(Query_Info[i].L_ListResultField).Value);
        dt1.FieldByName('Oper').Value :='=';     //如果用户是从列表中选取一行记录，操作符改为“=”号
        if Query_Info[i].L_ListDataSetName.Filtered then
        Query_Info[i].L_ListDataSetName.Filtered :=False;
      end  ;
    end ;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmFindcds.FindUnitInit  ;
begin

end;

procedure TfrmFindcds.dt1AfterScroll(DataSet: TDataSet);
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


  with    dt1  do    //
  begin
    DBGridEh1.FieldColumns['Condvalu'].PickList.Clear;
    for i:=0 to High(DropDown_Info) do
    if DropDown_Info[i].L_AddPickList<>nil then
    begin
      if  FieldByName('FieldName').IsNull=False then
      if  UpperCase(FieldByName('FieldName').Value) = UpperCase(DropDown_Info[i].L_DropdownColumn) then
      begin
        for j:=0 to High(DropDown_Info[i].L_AddPickList) do             //表格添加下拉列表项
        begin
          DBGridEh1.FieldColumns['Condvalu'].PickList.Add(DropDown_Info[i].L_AddPickList[j]);
        end;
      end;
    end
    else
    if DropDown_Info[i].L_ListDataSetName<>nil then
    begin

      if  FieldByName('FieldName').IsNull=False then
      if  UpperCase(FieldByName('FieldName').Value) = UpperCase(DropDown_Info[i].L_DropdownColumn) then
      begin
        DBGridEh1.FieldColumns['Condvalu'].ButtonStyle:=cbsEllipsis;
        exit;
      end;
      //DBGridEh1.FieldColumns['Condvalu'].PickList.Add(' ');
    end ;
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
   // DBGridEh1.FieldColumns['Condvalu'].PickList.Clear;
    for i:=0 to High(Query_Info) do
    if Query_Info[i].L_AddPickList<>nil then
    begin
      if  FieldByName('FieldName').IsNull=False then
      if  UpperCase(FieldByName('FieldName').Value) = UpperCase(Query_Info[i].L_DropdownColumn) then
      begin
        for j:=0 to High(Query_Info[i].L_AddPickList) do
        begin
          DBGridEh1.FieldColumns['Condvalu'].PickList.Add(Query_Info[i].L_AddPickList[j]);
        end;
      end;
    end
    else
    if Query_Info[i].L_ListDataSetName<>nil then
    begin

      if  FieldByName('FieldName').IsNull=False then
      if  UpperCase(FieldByName('FieldName').Value) = UpperCase(Query_Info[i].L_DropdownColumn) then
      begin
        DBGridEh1.FieldColumns['Condvalu'].ButtonStyle:=cbsEllipsis;
        exit;
      end;
      //DBGridEh1.FieldColumns['Condvalu'].PickList.Add(' ');
    end ;
    if dt1.FieldByName('FieldDataType').Value='ftBoolean' then
    with DBGridEh1.FieldColumns['Condvalu'] do
    begin
      PickList.Clear;
      PickList.Add('是');
      PickList.Add('否');
    end ;
  end;
end;

procedure TfrmFindcds.dt1CondvaluSetText(Sender: TField;
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

procedure TfrmFindcds.Button1Click(Sender: TObject);
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
              for i:=0 to High(DropDown_Info) do
              if  UpperCase(FieldByName('FieldName').Value) = UpperCase(DropDown_Info[i].L_DropdownColumn) then
              begin
                if DropDown_Info[i].L_AddPickList<>nil then
                begin
  //                if FieldByName('Oper').Value='><' then             //如果是介于
  //                  strWhere:=  strWhere+  Trim(FieldByName('FieldName1').AsString)
  //                  +' between  '+ FieldByName('Condvalu').AsString+' and ' + FieldByName('Condvalu2').AsString+' and '
  //                else
                  for j:=0 to High(DropDown_Info[i].L_AddPickList) do
                  begin
                    if UpperCase(DropDown_Info[i].L_AddPickList[j])=UpperCase(FieldByName('Condvalu').AsString ) then
                     strWhere:=  strWhere +' ( '+ Trim(FieldByName('FieldName1').AsString)
                    +FieldByName('Oper').AsString+DropDown_Info[i].L_PickListResultValues[j]+' )  and '  ;
                    SQLisAdd:=True;
                     // MsgError('条件出错！！！')
                   // else
                  end;
                end ;
              end ;

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

procedure TfrmFindcds.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmFindcds.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key in[VK_INSERT,VK_delete] then   //  , VK_down
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

procedure TfrmFindcds.dt1OperGetText(Sender: TField; var Text: String;
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

procedure TfrmFindcds.dt1OperSetText(Sender: TField; const Text: String);
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

procedure TfrmFindcds.DBGridEh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if (Sender as TDBGridEh).SumList.RecNo mod 2 = 1 then     // .SumList
   Background := $00FFC4C4;
end;

end.
