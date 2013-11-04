--���������Ľ��

--MisDescBegin
x206001_g_ScriptId = 206001
x206001_g_MissionIdPre =27
x206001_g_MissionId = 28
x206001_g_MissionKind = 8
x206001_g_MissionLevel = 40
x206001_g_ScriptIdNext = {ScriptId = 206002 ,LV = 1 }
x206001_g_Name	="�ٲ�̨" 
x206001_g_Name2	="ľ����" 
x206001_g_DemandItem ={{id=13010012,num=15}}
x206001_g_noDemandKill ={id=404,num=1}	

x206001_g_MissionName="���������Ľ��"
x206001_g_MissionInfo="    Ҫ��ΪӢ�ۣ������������ǲ���ģ�����Ҫ������������ӡ�\n \n    ���ǵľ���Խ��Խ����Խ��Խ�ࡣ�ɼ�˼��Ҫ�Ҵ�������Щ��������ѡ��һ��λ����˫ȫ���������ٷ򳤣���Ļ���ǳ���\n \n    Ҫ���ϰٷ򳤣���ע�صľ���ս��������ս�������ܷ��ˣ�����̽�ӻر���������һ�������Ľ������ȥ�ѵ��˶�ɱ�ˣ������ǵı��Ӹ�������֤����Ȼ�󽻸�#Gľ����#W��������ס����������Ҫ�����ǧ��ҪŪ�����٣���ָ�����������ӣ���������ˣС������"  --��������
x206001_g_MissionTarget="    �Ѱ�15��#c0080C0����ı���#W����#Gľ����#W��"		
x206001_g_MissionComplete="    ��ľ���迴����һ���Ӷ���ȾѪ�ı��ӣ�üͷ΢�壬�������Ͻ���¶����Ц�ݣ����������ã���ã������ٲ�̨��ֻҰ����������Ŷ��ʵ�ڱ�Ǹ��Ҳ���㲻֪���ɣ��ٲ�̨�������ɾ���Ӣ�µ�սʿ��ÿ�δ���������Ұ��һ����������ǰ�棬�󺹳���Ϊ���ɼ�˼���������������������ô�ص������һ���ܸ��ˣ�"					--�������npc˵���Ļ�
x206001_g_ContinueInfo="    ���Ǽ�����Ķ�Թ��ŭ������Ҫս��������й�ģ�"
--������
x206001_g_MoneyBonus = 10000

--�̶���Ʒ���������8��
x206001_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x206001_g_RadioItemBonus={}

--MisDescEnd
x206001_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x206001_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x206001_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x206001_g_MissionId) > 0 then
		if x206001_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x206001_g_MissionName)
			AddText(sceneId,x206001_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x206001_g_MissionTarget) 
			AddText(sceneId,format("\n    ����ı���   %d/%d", LuaFnGetItemCount(sceneId,selfId,x206001_g_DemandItem[1].id),x206001_g_DemandItem[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x206001_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x206001_g_MissionName)
		     AddText(sceneId,x206001_g_MissionComplete)
		     --AddText(sceneId,"#Y��Ҫ��Ʒ#W") 
		     --for i, item in x206001_g_DemandItem do  
		     --AddItemBonus(sceneId, item.id, item.num)
		     --end
		     AddMoneyBonus(sceneId, x206001_g_MoneyBonus)
                     EndEvent()
		     DispatchMissionContinueInfo(sceneId, selfId, targetId, x206001_g_ScriptId, x206001_g_MissionId)
                end

        elseif x206001_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x206001_g_MissionName)
                AddText(sceneId,x206001_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x206001_g_MissionTarget) 
		AddMoneyBonus(sceneId, x206001_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x206001_g_ScriptId, x206001_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x206001_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x206001_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x206001_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x206001_g_ScriptId, x206001_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x206001_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x206001_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x206001_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==6) then
        	if (GetName(sceneId,targetId)==x206001_g_Name) then
        	        if IsMissionHaveDone(sceneId, selfId, x206001_g_MissionIdPre) > 0 then
        	            if IsHaveMission(sceneId,selfId, x206001_g_MissionId)<= 0 then
        	            	return 1
        	            end
        	        end
        	end
		if (GetName(sceneId,targetId)==x206001_g_Name2) then
			    if IsHaveMission(sceneId,selfId, x206001_g_MissionId) > 0 then
			    	return 1
        	            end
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x206001_OnAccept(sceneId, selfId)

	BeginEvent(sceneId)
	AddMission( sceneId, selfId, x206001_g_MissionId, x206001_g_ScriptId, 1, 0, 0)
	AddText(sceneId,"��������"..x206001_g_MissionName) 
	EndEvent()
	DispatchMissionTips(sceneId, selfId)
		                                                           
	                                                                     
	     
end



--**********************************

--����

--**********************************







function x206001_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x206001_g_MissionId)
	for i, item in x206001_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x206001_CheckSubmit( sceneId, selfId, targetId)

	if LuaFnGetItemCount(sceneId,selfId,x206001_g_DemandItem[1].id) == x206001_g_DemandItem[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x206001_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x206001_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x206001_g_MissionId)
		AddExp(sceneId, selfId, x206001_g_ExpBonus)
		AddMoney(sceneId, selfId, x206001_g_MoneyBonus)
		for i, item in x206001_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x206001_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x206001_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x206001_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x206001_g_MissionId) >= 0 then     
       		 if objdataId == x206001_g_noDemandKill.id then 
       		    if LuaFnGetItemCount(sceneId,selfId,x206001_g_DemandItem[1].id) < x206001_g_DemandItem[1].num then
       		         if random(1,100)>20 then
       		        	 BeginAddItem(sceneId)                                                    
				 AddItem( sceneId,x206001_g_DemandItem[1].id, 1 )             
				 ret = EndAddItem(sceneId,selfId)                                 
		        	 if ret > 0 then                                                  
		        	 	BeginEvent(sceneId)
				 	AddText(sceneId,format("����ı���   %d/%d", LuaFnGetItemCount(sceneId,selfId,x206001_g_DemandItem[1].id)+1,x206001_g_DemandItem[1].num )) 
				 	EndEvent()
				 	DispatchMissionTips(sceneId, selfId)
				 	AddItemListToHuman(sceneId,selfId) 
		        	 else                                                             
		        	 	BeginEvent(sceneId)                                      
				     	AddText(sceneId,"��Ʒ��������")                    
				        EndEvent(sceneId)                                        
				        DispatchMissionTips(sceneId,selfId) 
				 end                     
		         end             
       		    end
       		 end
      		 
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x206001_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x206001_OnItemChanged(sceneId, selfId, itemdataId)

end

