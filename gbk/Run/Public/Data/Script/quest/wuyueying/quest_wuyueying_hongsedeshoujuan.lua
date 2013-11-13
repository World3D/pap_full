--��ɫ���־�

--MisDescBegin
x217003_g_ScriptId = 217003
x217003_g_MissionIdPre =174
x217003_g_MissionId = 175
x217003_g_MissionKind = 6
x217003_g_MissionLevel = 30
--x217003_g_ScriptIdNext = {ScriptId = 203003 ,LV = 1 }
x217003_g_Name	="�ܱ�" 
x217003_g_Name2	="������" 
x217003_g_noDemandItem ={{id=13010070,num=1}}
--x217003_g_noDemandKill ={{id=301,num=1}}	

x217003_g_MissionName="��ɫ���־�"
x217003_g_MissionInfo="    ʱ�䲻���ˣ���Ҫ��һʱ�������������������������͹�ȥ������\n \n    <�ܱ����ݹ�һ�����־��֣�ص�������>��������Σ�յ�ʱ�򣬰��ⶫ�������ֱ��ϣ�\n \n     ���ȷ�е�Ϊ���㣬����û�취����Ҳ��֪���������䣬������֪��������û�뿪����Ӫ��"  --��������
x217003_g_MissionTarget="    �Ѻ��־��͸�#G������#W��Ȼ���������#G�ܱ�#W��"		
x217003_g_MissionComplete="    ��һ·�������ˡ�"					--�������npc˵���Ļ�
x217003_g_ContinueInfo="    �����͵�����"
x217003_g_ContinueInfo2="    �ҵ����Ѿ��ܾ��ˣ��������Ұɣ����ȥ�����ܱ𽫾����������ľ����ˣ�"
--������
x217003_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x217003_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x217003_g_RadioItemBonus={}

--MisDescEnd
x217003_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x217003_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	misIndex = GetMissionIndexByID(sceneId,selfId,x217003_g_MissionId)
	if x217003_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x217003_g_MissionId) > 0 then
		if x217003_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     	BeginEvent(sceneId)
                     	AddText(sceneId,"#Y"..x217003_g_MissionName)
		     	AddText(sceneId,x217003_g_MissionComplete)
		     	AddMoneyBonus(sceneId, x217003_g_MoneyBonus)
		     	EndEvent()
                     	DispatchMissionContinueInfo(sceneId, selfId, targetId, x217003_g_ScriptId, x217003_g_MissionId)
                end
                if x217003_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                	if (GetName(sceneId,targetId)==x217003_g_Name) then
                		BeginEvent(sceneId)
				AddText(sceneId,"#Y"..x217003_g_MissionName)
				AddText(sceneId,x217003_g_ContinueInfo)
				AddText(sceneId,"#Y����Ŀ��#W") 
				AddText(sceneId,x217003_g_MissionTarget) 
				AddText(sceneId,format("\n    ���־��͸�������   %d/1", GetMissionParam(sceneId,selfId,misIndex,0) ))
		     		EndEvent()
				DispatchEventList(sceneId, selfId, targetId)
			end
			if (GetName(sceneId,targetId)==x217003_g_Name2) then
                		BeginEvent(sceneId)
				AddText(sceneId,"#Y"..x217003_g_MissionName)
				AddText(sceneId,x217003_g_ContinueInfo2)
				EndEvent()
				DispatchEventList(sceneId, selfId, targetId)
				SetMissionByIndex(sceneId,selfId,misIndex,0,1)
				BeginEvent(sceneId)
				AddText(sceneId,format("���־��͸�������   %d/1", GetMissionParam(sceneId,selfId,misIndex,0) ))
		     		EndEvent()
		     		DispatchMissionTips(sceneId, selfId)
		     		for i, item in pairs(x217003_g_noDemandItem) do
					DelItem(sceneId, selfId, item.id, item.num)
				end
			end
                		
                end

        elseif x217003_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x217003_g_MissionName)
                AddText(sceneId,x217003_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x217003_g_MissionTarget) 
		AddMoneyBonus(sceneId, x217003_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x217003_g_ScriptId, x217003_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x217003_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x217003_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x217003_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x217003_g_ScriptId, x217003_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x217003_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x217003_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x217003_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==20) then
        	if IsMissionHaveDone(sceneId, selfId, x217003_g_MissionIdPre) > 0 then
        	misIndex = GetMissionIndexByID(sceneId,selfId,x217003_g_MissionId)
        		if (GetName(sceneId,targetId)==x217003_g_Name) then
        	            		return 1
        		end
			if (GetName(sceneId,targetId)==x217003_g_Name2) then
			   	 if IsHaveMission(sceneId,selfId, x217003_g_MissionId) > 0 then
			    		if LuaFnGetItemCount(sceneId,selfId,x217003_g_noDemandItem[1].id) == 1 then
			    			return 1
			    		end
        	           	 end
        		end
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x217003_OnAccept(sceneId, selfId)

	                                                  
	BeginAddItem(sceneId)                                                    
	AddItem( sceneId,x217003_g_noDemandItem[1].id, x217003_g_noDemandItem[1].num )             
	ret = EndAddItem(sceneId,selfId)                                 
	if ret > 0 then                                                  
	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x217003_g_MissionId, x217003_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x217003_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		AddItemListToHuman(sceneId,selfId)
	else                                                             
		BeginEvent(sceneId)                                      
		AddText(sceneId,"��Ʒ����������������������")                    
		EndEvent(sceneId)                                        
		DispatchMissionTips(sceneId,selfId)                      
	end     
	     	                                    
	     
end



--**********************************

--����

--**********************************

function x217003_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x217003_g_MissionId)
	for i, item in pairs(x217003_g_noDemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x217003_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x217003_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == 1 then
			    		return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x217003_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x217003_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x217003_g_MissionId)
		AddExp(sceneId, selfId, x217003_g_ExpBonus)
		AddMoney(sceneId, selfId, x217003_g_MoneyBonus)
		for i, item in pairs(x217003_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end
		--CallScriptFunction( x217003_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x217003_OnKillObject(sceneId, selfId, objdataId)
	 

end



--**********************************

--���������¼�

--**********************************

function x217003_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x217003_OnItemChanged(sceneId, selfId, itemdataId)

end

