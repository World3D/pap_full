--�ɼ�˼������

--MisDescBegin
x205006_g_ScriptId = 205006
--x205006_g_MissionIdPre =40
x205006_g_MissionId = 46
x205006_g_MissionKind = 11
x205006_g_MissionLevel = 55
--x205006_g_ScriptIdNext = {ScriptId = 205002 ,LV = 1 }
x205006_g_Name	="Ҳ��" 
x205006_g_Name2	="������" 
x205006_g_DemandItem ={{id=13010003,num=1}}
--x205006_g_noDemandKill ={{id=301,num=1}}	

x205006_g_MissionName="�ɼ�˼������"
x205006_g_MissionInfo="    �����������ŷǳ�����Ҫ�����Ǵ�д��������ģ����Ħڭħ���ţ���������д�ģ�\n \n�װ���Ħڭĩ������\n \n    ��������������Ҵ�����������ĽӴ������ǣ����Ǵ�������ƷҲ�����ꡣ�����ٴ�������ȥ�������ó�ס��ӽ��Ժ�����Ӧ�ü�ǿ�������ǳ�Թ��ŧ�����Լ�����ɧ�ҷ���Ķ�֭����ϴ����\n \n                                   �ɼ�˼��\n \n    ����һ�����Ҫ���ţ�����Ҫ������������ʿ������������������������ţ��͵�#R������#W���ӵ����ϣ�����ת����Ħڭħ���������������ǵ�֮�����ᡣ"  --��������
x205006_g_MissionTarget="    ��#c0080C0�ɼ�˼������#W�͵�#G������#W������"		
x205006_g_MissionComplete="    ���������һ�����ģ�۹��ش��ﲩ����Դ�ḻ�������Ͳ���Ҫ���Ǹ�����ͨ�̡��������Һܾ������������"					--�������npc˵���Ļ�
--x205006_g_ContinueInfo="    ���ܸ��������ۣ�ҲҪ���Ǽ��������û�����"
--������
x205006_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x205006_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x205006_g_RadioItemBonus={}

--MisDescEnd
x205006_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x205006_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x205006_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x205006_g_MissionId) > 0 then
		
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x205006_g_MissionName)
		     AddText(sceneId,x205006_g_MissionComplete)
		     --AddText(sceneId,"#Y��Ҫ��Ʒ#W") 
		     --for i, item in pairs(x205006_g_DemandItem) do  
		     --AddItemBonus(sceneId, item.id, item.num)
		     --end
		     AddMoneyBonus(sceneId, x205006_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x205006_g_ScriptId, x205006_g_MissionId)
                

        elseif x205006_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x205006_g_MissionName)
                AddText(sceneId,x205006_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x205006_g_MissionTarget) 
		AddMoneyBonus(sceneId, x205006_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x205006_g_ScriptId, x205006_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x205006_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x205006_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x205006_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x205006_g_ScriptId, x205006_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x205006_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x205006_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x205006_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==5) then
        	if (GetName(sceneId,targetId)==x205006_g_Name) then
        	        if IsHaveMission(sceneId,selfId, x205006_g_MissionId)<= 0 then
        	            	return 1
        	        end
        	end
		if (GetName(sceneId,targetId)==x205006_g_Name2) then
			    if IsHaveMission(sceneId,selfId, x205006_g_MissionId) > 0 then
			    	return 1
        	            end
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x205006_OnAccept(sceneId, selfId)

	                                                  
	BeginAddItem(sceneId)                                                    
	AddItem( sceneId,x205006_g_DemandItem[1].id, x205006_g_DemandItem[1].num )             
		ret = EndAddItem(sceneId,selfId)                                 
	        if ret > 0 then                                                  
	        	BeginEvent(sceneId)
			AddMission( sceneId, selfId, x205006_g_MissionId, x205006_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x205006_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)AddItemListToHuman(sceneId,selfId) 
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

function x205006_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x205006_g_MissionId)
	for i, item in pairs(x205006_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x205006_CheckSubmit( sceneId, selfId, targetId)

	if LuaFnGetItemCount(sceneId,selfId,x205006_g_DemandItem[1].id) == 1 then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x205006_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x205006_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x205006_g_MissionId)
		AddExp(sceneId, selfId, x205006_g_ExpBonus)
		AddMoney(sceneId, selfId, x205006_g_MoneyBonus)
		for i, item in pairs(x205006_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x205006_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x205006_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x205006_OnKillObject(sceneId, selfId, objdataId)
	 

end



--**********************************

--���������¼�

--**********************************

function x205006_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x205006_OnItemChanged(sceneId, selfId, itemdataId)

end

